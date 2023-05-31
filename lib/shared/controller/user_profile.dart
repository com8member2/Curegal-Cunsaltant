
import 'package:consultation_curegal/shared/model/user_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:io';
import '../../consatant/Constants.dart';
import '../../utility/utility.dart';

part 'user_profile.g.dart';

@riverpod
class UserProfile extends _$UserProfile {
  @override
  UserEntity build() {
    return UserEntity();
  }

  getUserData() async {
    var res = await Constants.supabaseClient.from(SupaTables.consultantProfile).select().eq("supabase_auth_id", Constants.supabaseClient.auth.currentUser?.id) as List;
    state = UserEntity.fromJson(res.first as Map<String, dynamic>);
  }

  update(Map<String,dynamic> map) async {
    print(" in method   ${(await getSharedPreference()).getString(PrefsKeys.consultantID)}");
    var res = await Constants.supabaseClient.from(SupaTables.consultantProfile).update(map)
        .match({'id' : (await getSharedPreference()).getString(PrefsKeys.consultantID)});

    state = UserEntity.fromJson(res);
  }

  insert(Map<String,dynamic> map) async {
    var res = await Constants.supabaseClient.from(SupaTables.consultantProfile).insert(map).select().single();
    state = UserEntity.fromJson(res);

     (await getSharedPreference()).setString(PrefsKeys.consultantID, res['id']);
    print(" in if   ${(await getSharedPreference()).getString(PrefsKeys.consultantID)}");

  }

  uploadProfile(File file) async {
    var res = await Constants.supabaseClient.storage.from('consultant_documents')
        .upload('${Constants.supabaseClient.auth.currentSession?.user.id}/profile.jpg', file).then(
      (value) {

        Constants.supabaseClient.from(SupaTables.consultantProfile)
            .update({'profile' : Constants.supabaseClient.storage.from('consultant_documents').getPublicUrl('${Constants.supabaseClient.auth.currentSession?.user.id}/profile.jpg')})
            .eq('id', Constants.supabaseClient.auth.currentSession?.user.id);
      },
    );
    state = UserEntity.fromJson(res);
  }


}
