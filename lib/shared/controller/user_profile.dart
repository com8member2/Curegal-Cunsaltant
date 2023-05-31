import 'dart:developer';

import 'package:consultation_curegal/shared/model/user_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../consatant/Constants.dart';
import '../../utility/utility.dart';

part 'user_profile.g.dart';

@riverpod
class UserProfile extends _$UserProfile {
  @override
  UserEntity build() {
    return UserEntity();
  }

  update() async {
    var res = await Constants.supabaseClient.from(SupaTables.consultantUsers).select().eq("supabase_auth_id", Constants.supabaseClient.auth.currentUser?.id).single();
    state = UserEntity.fromJson(res as Map<String, dynamic>);
  }
}
