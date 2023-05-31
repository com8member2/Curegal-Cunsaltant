import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../../../consatant/Constants.dart';
import '../../../routing/app_routes.dart';
import '../../../utility/utility.dart';
import '../../authentication/Controller/auth_controller.dart';
import '../repository/consultant_profile_repository.dart';
part 'consultant_profile_controller.g.dart';

@riverpod
// ignore: stateless_ref
Future<void> addConsultant(ref,String userNameController, String emailController,
    String dateController, String selectedGender, String stateController,
    String cityController, String phoneNumber,String consulting_price,
    BuildContext context) async {


    EasyLoading.show(status: "Loading...");

    var consultantProfileRepository = ref.watch(profileRepositoryProvider);

    var res = await consultantProfileRepository.addConsultant({
      'id': Constants.supabaseClient.auth.currentUser?.id,
      'name': userNameController,
      'email': emailController,
      'date_of_birth': dateController,
      'gender': selectedGender,
      'state': stateController,
      'city': cityController,
      'phone': phoneNumber,
      'consulting_price': consulting_price,
      'profile' : Constants.supabaseClient.storage.url
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



@riverpod
Future<List<dynamic>> getConsultantProfile(GetConsultantProfileRef ref) async {
  var consultantProfileRepository = ref.watch(profileRepositoryProvider);
  ref.read(authControllerProvider).phoneNumber = (await getSharedPreference()).getString(PrefsKeys.phoneNumber)!;
  PostgrestResponse<dynamic> res = await consultantProfileRepository.getConsultantProfile();
  return res.data as List<dynamic>;
}




