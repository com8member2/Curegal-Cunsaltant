import 'package:consultation_curegal/shared/controller/user_profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../consatant/Constants.dart';
import '../../../utility/utility.dart';
import '../controller/consultation_category_controller.dart';
import '../model/consultation_category_entity.dart';

final consultationCategoryRepositoryProvider = Provider.autoDispose((_) => ConsultationCategoryRepository());

class ConsultationCategoryRepository {
  Future<List<ConsultationCategoryEntity>> getCategories(int personType) async {
    List list =
        await Constants.supabaseClient.from(SupaTables.consultationCategory).select("*,${SupaTables.consultationSubCategory}(*)").eq("consultant_persons_id", personType);
    return list.map((e) => ConsultationCategoryEntity.fromJson(e)).toList();
  }

  Future<void> addConsultationCategory(WidgetRef ref, int personType) async {
    var id = (await getSharedPreference()).getString(PrefsKeys.consultantID);
    var data = ref
        .read(subItemSelectedProvider)
        .map((e) => {
              'consultant_person_id': id,
              'consultation_category_id': e.consultationCategoryId,
              'consultation_sub_category_ids': e.id,
              'consultation_sub_category_name': e.name
            })
        .toList();

    await Constants.supabaseClient.from('consultant_sub_categories').insert(data).then((value) async {
      if(!(ref.read(userProfileProvider).consultantPersonType != null))
      await ref.read(userProfileProvider.notifier).update({"consultant_person_type": personType});
    });
    ref.read(subItemSelectedProvider.notifier).reset();
  }
}
