import 'dart:io';

import 'package:consultation_curegal/consatant/Constants.dart';
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

      final avatarFile = File(result.files.single.path!);



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
  return ref.watch(accountRepositoryProvider).getDocuments(personType);
}

@riverpod
Future uploadDocument(UploadDocumentRef ref, Map map, ConsultantDocumentsEntity doc) async {
  EasyLoading.show();
  try {
    var value = await Constants.supabaseClient.storage.from('consultant_documents').upload(
        '${Constants.supabaseClient.auth.currentSession?.user.id}/Documents/${doc.documents?.name}.jpg', ref.read(documentControllerProvider),
        fileOptions: FileOptions(upsert: true));
    map.addAll({
      "consultant_id": (await getSharedPreference()).getString(PrefsKeys.consultantID),
      "document_id": doc.documents?.id ?? 0,
      "document_status": DocumentStatus.uploaded.name,
      "documents_file": value.toString(),
    });
    await Constants.supabaseClient.from('consultant_documents_status').insert(map);
    EasyLoading.dismiss();
  } on Exception catch (e) {
    EasyLoading.showError(e.toString());
  }
}
