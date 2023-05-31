import 'dart:developer';

import 'package:consultation_curegal/shared/controller/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../consatant/Constants.dart';
import '../../../routing/app_routes.dart';
import '../../../utility/utility.dart';
import '../repository/auth_repository.dart';

final authControllerProvider = Provider((ref) {
  var repository = ref.watch(authRepositoryProvider);
  return AuthController(ref: ref, authRepository: repository);
});

class AuthController {
  final ProviderRef ref;
  final AuthRepository authRepository;

  AuthController({required this.ref, required this.authRepository});

  var country = "";
  var phoneNumber = "";

  Future<void> checkUser(String countryCode, String phone, BuildContext context) async {
    if (EasyLoading.isShow) return;
    try {
      await EasyLoading.show(status: 'loading...');

      var phoneNumber = "+$countryCode $phone";

      final response = await authRepository.checkUser(phoneNumber);

      print("response login $response & phonenumber $phone");

      Constants.isNewUser = !response;

        authRepository.signInWithOtp(phoneNumber).then((value) {
          Navigator.pushNamed(context, AppRoutes.sendOtpScreen, arguments: {"phoneNumber": phoneNumber});
        });

      EasyLoading.dismiss();
    } catch (e) {
      log(e.toString());
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }

  Future<void> submit(String otpValue, String phoneNumber, BuildContext context) async {
    if (EasyLoading.isShow) return;
    await EasyLoading.show(status: "Loading...");
    authRepository.verifyOtp(otpValue, phoneNumber).then((value) async {
      final consultantData = await authRepository.getConsultantAuthID();
      if (consultantData.isEmpty) {
        ref.read(userProfileProvider.notifier).insert({'supabase_auth_id': Constants.supabaseClient.auth.currentSession?.user.id,"phone":phoneNumber});
      } else {
        ref.read(userProfileProvider.notifier).getUserData();
        (await getSharedPreference()).setString(PrefsKeys.consultantID, consultantData[0]['id']);
        print(" in else   ${(await getSharedPreference()).getString(PrefsKeys.consultantID)}");

      }
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.splashScreen, (route) => true);

      EasyLoading.dismiss();
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
      EasyLoading.showInfo("Please check otp or resend otp");
    });
  }
}
