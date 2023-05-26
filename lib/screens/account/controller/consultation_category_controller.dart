import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../../../consatant/Constants.dart';
import '../../../routing/app_routes.dart';
import '../repository/consultant_profile_repository.dart';
import '../repository/consultation_category_repository.dart';

final consultationCategoryControllerProvider = Provider((ref) {
  var repository = ref.watch(consultationCategoryRepositoryProvider);
  return ConsultationCategoryController(ref: ref, profileRepository: repository);
});

class ConsultationCategoryController {
  final ProviderRef ref;
  final ConsultationCategoryRepository profileRepository;

  ConsultationCategoryController({required this.ref, required this.profileRepository});

  Future<PostgrestResponse> getConsultationCategory(context , int id) async {
    var temp;
    EasyLoading.show(status: "Loading...");
    profileRepository.getConsultationCategory(id).then(
          (value) {
            temp = value;
            print("doctor data ${value}");
        EasyLoading.dismiss();
        Constants.isNewUser = false;
        Navigator.pushNamed(context, AppRoutes.splashScreen);
      },
    ).onError((error, stackTrace) {
      EasyLoading.dismiss();
      EasyLoading.showError(error.toString());
    });
   return temp as PostgrestResponse<dynamic>;
  }
}
