import 'dart:developer';
import 'dart:io';

import 'package:consultation_curegal/consatant/Constants.dart';
import 'package:consultation_curegal/routing/app_routes.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../shared/controller/user_profile.dart';
import '../../../utility/utility.dart';
import '../model/consultant_documents_entity.dart';
import '../repository/account_repository.dart';

part 'document_controller.g.dart';

@riverpod
class DocumentController extends _$DocumentController {
  @override
  File build() {
    return File("");
  }

  getImageFromGallery() async {
    var docType = ['jpg', 'jpeg', 'pdf', 'png'];
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: docType);
    if (result != null) {
      state = File(result.files.single.path!);
    } else {
      EasyLoading.showInfo("Please Select again");
    }
  }

  getImageFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    // print("file path on submitt ${ ref.read(documentControllerProvider.notifier).getImageFromGallery()}");
    if (pickedFile != null) {
      state = File(pickedFile.path);
    }
  }

  reset() {
    state = File("");
  }
}

@riverpod
Future<List<ConsultantDocumentsEntity>> getDocuments(GetDocumentsRef ref, int personType) async {
  List<ConsultantDocumentsEntity> res = await ref.watch(accountRepositoryProvider).getDocuments(personType);
  var documentStatus = false;
  for (var element in res) {
    if (element.consultantDocumentsStatus?.isNotEmpty ?? false) {
      if (element.consultantDocumentsStatus?.first.documentStatus == DocumentStatus.pending.name ||
          element.consultantDocumentsStatus?.first.documentStatus == DocumentStatus.rejected.name) {
        break;
      } else {
        if (element == res.last) {
          documentStatus = true;
        }
      }
    } else {
      break;
    }
  }
  if(documentStatus != ref.watch(userProfileProvider).documentationStatus) {
    ref.watch(userProfileProvider.notifier).update({"documentation_status": documentStatus});
  }

  return res;
}

@riverpod
Future uploadDocument(UploadDocumentRef ref, Map map, ConsultantDocumentsEntity doc, BuildContext context) async {
  EasyLoading.show();
  try {
    var value = await Constants.supabaseClient.storage.from('consultant_documents').upload(
        '${Constants.supabaseClient.auth.currentSession?.user.id}/Documents/${doc.documents?.name}.jpg', ref.read(documentControllerProvider),
        fileOptions: FileOptions(upsert: true));
    var id = (await getSharedPreference()).getString(PrefsKeys.consultantID);
    map.addAll({
      "consultant_id": id,
      "consultant_documents_id": doc.id ?? 0,
      "document_id": doc.documents?.id ?? 0,
      "document_status": DocumentStatus.uploaded.name,
      "documents_file": value.toString(),
    });
    await Constants.supabaseClient.from('consultant_documents_status').insert(map);
    Navigator.pop(context);
    ref.invalidate(getDocumentsProvider);
    EasyLoading.showSuccess("Document Uploaded Successfully");
  } on Exception catch (e) {
    log(e.toString());
    EasyLoading.showError(e.toString());
  }
}
