import 'dart:developer';

import 'package:consultation_curegal/shared/model/user_entity.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
        await uploadProfile(file);
        map.addAll({
          'profile': Constants.supabaseClient.storage.from('consultant_documents').getPublicUrl('${Constants.supabaseClient.auth.currentSession?.user.id}/profile.jpg')
        });
      }
      print(" in method   ${map}");
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
    } on Exception catch (e) {
      log(e.toString());
      EasyLoading.showError("Something went wrong");
    }
  }

  insert(Map<String, dynamic> map) async {
    var res = await Constants.supabaseClient.from(SupaTables.consultantProfile).insert(map).select().single();
    state = UserEntity.fromJson(res);

    (await getSharedPreference()).setString(PrefsKeys.consultantID, res['id']);
    print(" in if   ${(await getSharedPreference()).getString(PrefsKeys.consultantID)}");
  }

  uploadProfile(File file) async {
    await Constants.supabaseClient.storage
        .from('consultant_documents')
        .upload('${Constants.supabaseClient.auth.currentSession?.user.id}/profile.jpg', file, fileOptions: const FileOptions(upsert: true))
        .then((value) {
      state = state.copyWith(profile: value);
    });
    ref.read(documentControllerProvider.notifier).reset();
  }
}
