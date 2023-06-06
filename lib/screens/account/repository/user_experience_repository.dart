

import 'package:consultation_curegal/shared/controller/user_profile.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../consatant/Constants.dart';
import 'package:flutter/cupertino.dart';
import '../model/consultation_category_entity.dart';

final experienceRepositoryProvider = Provider.autoDispose((_) => ExperienceRepositoryProvider());

class ExperienceRepositoryProvider {
  Future<List<dynamic>> getExperience(int personType) async {
    List list = await Constants.supabaseClient.from(SupaTables.userExperience).select();
    return list;
  }

  Future<void> addExperience(Map map,BuildContext context) async {
    await Constants.supabaseClient.from(SupaTables.userExperience).insert(map).then((value) async {
      Navigator.pop(context);
    }).onError( (error, stackTrace) {
      EasyLoading.showError(error.toString());
    });
  }
}
