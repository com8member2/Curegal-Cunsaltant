import 'dart:io';

import 'package:consultation_curegal/consatant/Constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../shared/controller/user_profile.dart';

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

  reset()
  {
    state = File("");
  }




}
