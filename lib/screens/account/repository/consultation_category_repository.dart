import 'package:consultation_curegal/shared/controller/user_profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../../../consatant/Constants.dart';
import '../controller/consultation_category_controller.dart';
import '../model/consultation_category_entity.dart';

final consultationCategoryRepositoryProvider = Provider.autoDispose((_) => ConsultationCategoryRepository());

class ConsultationCategoryRepository {
  Future<List<ConsultationCategoryEntity>> getCategories(int personType) async {
    PostgrestResponse<dynamic> res = await Constants.supabaseClient.from(SupaTables.consultationCategory).select().eq("consultant_persons_id", personType).execute();
    var list = res.data as List<dynamic>;
    List subCat = await Constants.supabaseClient.from(SupaTables.consultationSubCategory).select().in_("consultation_category_id", res.data.map((e) => e["id"]).toList());
    return list
        .map((e) {
          (e).addAll({"data": subCat.where((element) => element["consultation_category_id"] == e["id"]).toList(), "isSelected": false});
          return e;
        })
        .map((e1) => ConsultationCategoryEntity.fromJson(e1))
        .toList();
  }

  Future<void> addConsultationCategory(WidgetRef ref, int personType) async {
    var data = ref
        .read(subItemSelectedProvider)
        .map((e) => {
              'consultant_person_id': Constants.supabaseClient.auth.currentUser?.id,
              'consultation_category_id': e.consultationCategoryId,
              'consultation_sub_category_ids': e.id,
              'consultation_sub_category_name': e.name
            })
        .toList();
    await Constants.supabaseClient.from('consultant_sub_categories').insert(data).then((value) async {
      await ref.read(userProfileProvider.notifier).update({"consultant_person_type":personType});
    });
    ref.read(subItemSelectedProvider.notifier).reset();
  }
}
