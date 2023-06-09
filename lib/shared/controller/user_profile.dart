import 'dart:developer';

import 'package:consultation_curegal/shared/model/user_entity.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:io';
import '../../consatant/Constants.dart';
import '../../screens/account/controller/consultant_profile_controller.dart';
import '../../screens/account/controller/document_controller.dart';
import '../../utility/utility.dart';

part 'user_profile.g.dart';

@riverpod
class UserProfile extends _$UserProfile {
  @override
  UserEntity build() {
    ref.keepAlive();
    getUserData();
    return UserEntity();
  }

  Future<UserEntity> getUserData() async {
    var res = await Constants.supabaseClient.from(SupaTables.consultantProfile).select().eq("supabase_auth_id", Constants.supabaseClient.auth.currentUser?.id) as List;
    state = UserEntity.fromJson(res.first as Map<String, dynamic>);
    return state;
  }

  update(Map<String, dynamic> map) async {
    EasyLoading.show(status: "Data update in progress");
    try {
      var file = ref.read(documentControllerProvider);
      if (file.path.isNotEmpty) {
        await compressAndGetFile(file, file.path);
        await uploadProfile(file);
        map.addAll({
          'profile': Constants.supabaseClient.storage.from('consultant_documents').getPublicUrl('${(await getSharedPreference()).getString(PrefsKeys.userProfileUrl)}')
        });

        print(
            'public url ${Constants.supabaseClient.storage.from('consultant_documents').getPublicUrl('${(await getSharedPreference()).getString(PrefsKeys.userProfileUrl)}')}');
      }
      await Constants.supabaseClient
          .from(SupaTables.consultantProfile)
          .update(map)
          .match({'id': (await getSharedPreference()).getString(PrefsKeys.consultantID)})
          .select()
          .then(
            (value) {
              state = UserEntity.fromJson(value[0]);
              ref.watch(getConsultantProfileProvider.notifier).refesh(value[0]);
              EasyLoading.dismiss();
            },
          );
    } on Exception catch (e, stackTrac) {
      log(e.toString());
      log(stackTrac.toString());
      EasyLoading.showError("Something went wrong");
    }
  }

  uploadProfile(File file) async {
    if ((await getSharedPreference()).getString(PrefsKeys.userProfileUrl) !=
        '${Constants.supabaseClient.auth.currentSession?.user.id}/profile_${DateTime.now().millisecond}.jpg') {
      print("old url ${(await getSharedPreference()).getString(PrefsKeys.userProfileUrl)}");

      await Constants.supabaseClient.storage.from('consultant_documents').remove([(await getSharedPreference()).getString(PrefsKeys.userProfileUrl) ?? ""]).then((value) {
        state = state.copyWith(profile: value.toString());
      });

      (await getSharedPreference()).remove(PrefsKeys.userProfileUrl);

      (await getSharedPreference())
          .setString(PrefsKeys.userProfileUrl, '${Constants.supabaseClient.auth.currentSession?.user.id}/profile_${DateTime.now().millisecond}.jpg');

      await Constants.supabaseClient.storage
          .from('consultant_documents')
          .upload((await getSharedPreference()).getString(PrefsKeys.userProfileUrl) ?? "", file, fileOptions: const FileOptions(upsert: true))
          .then((value) {
        state = state.copyWith(profile: value);
      });

      ref.read(documentControllerProvider.notifier).reset();

      print("old url3 ${(await getSharedPreference()).getString(PrefsKeys.userProfileUrl)}");
    }
  }

  insert(Map<String, dynamic> map) async {
    var res = await Constants.supabaseClient.from(SupaTables.consultantProfile).insert(map).select().single();
    state = UserEntity.fromJson(res);

    (await getSharedPreference()).setString(PrefsKeys.consultantID, res['id']);
    print(" in if   ${(await getSharedPreference()).getString(PrefsKeys.consultantID)}");
  }

  Future<dynamic> compressAndGetFile(File file, String targetPath) async {
    int fileSize = await file.length();
    double fileSizeInKB = fileSize / 1024;
    double fileSizeInMB = fileSizeInKB / 1024;
    var result;

    if (fileSizeInMB < 1) {
      result = await FlutterImageCompress.compressWithFile(
        file.absolute.path,
        quality: 95,
      );
    } else {
      EasyLoading.showInfo('Please select file between 1MB');
    }

    log('file ${fileSize} & file size in kb - ${fileSizeInKB} & file size in mb - ${fileSizeInMB}');

    return File.fromRawPath(result!);
  }
}
