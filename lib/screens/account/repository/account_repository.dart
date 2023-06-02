import 'dart:developer';

import 'package:consultation_curegal/screens/account/model/consultant_documents_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../../../consatant/Constants.dart';
import '../../../routing/app_routes.dart';
import '../../../shared/controller/user_profile.dart';
import '../../../utility/utility.dart';
import '../controller/language_controller.dart';

final accountRepositoryProvider = Provider.autoDispose((ref) => AccountRepository());

class AccountRepository {
  Future<List> getAllLanguages() async {
    List res = await Constants.supabaseClient.from('languages').select();
    List lan =
        await Constants.supabaseClient.from('consultant_languages').select().eq("consultant_person_id", (await getSharedPreference()).getString(PrefsKeys.consultantID));
    return res.map((e) {
      if (lan.any((element) => element["consultant_language_name"] == e["name"])) {
        e["isSelected"] = true;
      }
      return e;
    }).toList();
  }

  Future<List<ConsultantDocumentsEntity>> getDocuments(int personType) async {
    List res = await Constants.supabaseClient.from('consultant_documents').select('*, documents!inner(*), consultant_documents_status(*)').eq("consultant_person_type_id", personType).eq("consultant_documents_status.consultant_id", (await getSharedPreference()).getString(PrefsKeys.consultantID));
    return res.map((e) => ConsultantDocumentsEntity.fromJson(e)).toList();
  }

  Future<void> selectLanguages(WidgetRef ref, BuildContext context) async {
    final selectedValues = ref.read(languagesProvider).value?.where((element) => element["isSelected"] ?? false).toList() ?? [];
    if (selectedValues.isEmpty) return;
    EasyLoading.show();
    var id = (await getSharedPreference()).getString(PrefsKeys.consultantID);
    await Constants.supabaseClient.from('consultant_languages').delete().match({"consultant_person_id": id});
    await Constants.supabaseClient
        .from('consultant_languages')
        .insert(selectedValues.map((e) {
          return {'consultant_person_id': id, 'consultant_language_name': e["name"]};
        }).toList())
        .then(
      (value) async {
        await ref.read(userProfileProvider.notifier).update({"consultation_language_status": true});
        EasyLoading.dismiss();
        Navigator.popUntil(context, (route) => route.settings.name == AppRoutes.homeScreen);
      },
    ).onError((error, stackTrace) {
      EasyLoading.showError(error.toString());
    });
  }
}
