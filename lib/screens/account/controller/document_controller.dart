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
  var _imageFile = File("");

  @override
  File build() {
    return _imageFile;
  }

  getImageFromGallery() async {
    var docType = ['jpg', 'jpeg', 'pdf', 'png'];
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: docType);
    if (result != null) {
      _imageFile = File(result.files.single.path!);
      state = _imageFile;

      final avatarFile = File(result.files.single.path!);
      ref.read(userProfileProvider.notifier).uploadProfile(avatarFile);
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
    print("file path on submitt ${ ref.read(documentControllerProvider.notifier).getImageFromGallery()}");
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);

      final avatarFile = File(pickedFile.path);
      ref.read(userProfileProvider.notifier).uploadProfile(avatarFile);
    }
    state = _imageFile;
  }





}
