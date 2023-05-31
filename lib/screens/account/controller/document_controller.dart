import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'document_controller.g.dart';

@riverpod
class DocumentController extends _$DocumentController {

  @override
  File build() {
    return File("");
  }

  getImageFromGallery() async {
    var docType = ['jpg', 'jpeg', 'pdf', 'png'];
    //That use fully File manager and also use specific file type like jpg, png, pdf, png etc...
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: docType);

    if (result != null) {
      state = File(result.files.single.path!);
      print("file size lenghtSync :- ${state.lengthSync()}");
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
    if (pickedFile != null) {
      state = File(pickedFile.path);
    }else {
      EasyLoading.showInfo("Please Select again");
    }
  }
}
