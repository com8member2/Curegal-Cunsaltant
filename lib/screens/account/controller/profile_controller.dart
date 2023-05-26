import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../../../consatant/Constants.dart';
import '../../../routing/app_routes.dart';
import '../repository/consultant_profile_repository.dart';

final profileControllerProvider = Provider((ref) {
  var repository = ref.watch(profileRepositoryProvider);
  return ProfileController(ref: ref, profileRepository: repository);
});

class ProfileController {
  final ProviderRef ref;
  final ProfileRepository profileRepository;

  ProfileController({required this.ref, required this.profileRepository});

  Future<void> addConsultant(String userNameController, String emailController, String dateController, String selectedGender, String stateController,
      String cityController, String phoneNumber,String consulting_price, BuildContext context) async {
    EasyLoading.show(status: "Loading...");
    profileRepository.addConsultant({
      'id': Constants.supabaseClient.auth.currentUser?.id,
      'name': userNameController,
      'email': emailController,
      'date_of_birth': dateController,
      'gender': selectedGender,
      'state': stateController,
      'city': cityController,
      'phone': phoneNumber,
      'consulting_price': consulting_price
    }).then(
      (value) {
        EasyLoading.dismiss();
        Constants.isNewUser = false;
        Navigator.pushNamed(context, AppRoutes.splashScreen);
      },
    ).onError((error, stackTrace) {
      EasyLoading.dismiss();
      EasyLoading.showError(error.toString());
    });
  }
}
