
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../../../consatant/Constants.dart';
import '../../../routing/app_routes.dart';
import '../repository/auth_repository.dart';

final authControllerProvider = Provider((ref) {
  var repository = ref.watch(authRepositoryProvider);
  return AuthController(ref: ref, authRepository: repository);
});

class AuthController {
  final ProviderRef ref;
  final AuthRepository authRepository;

  AuthController({required this.ref, required this.authRepository});

  Future<void> checkUser(String countryCode, String phone, BuildContext context) async {
    try {
      EasyLoading.show(status: 'loading...');
      var phoneNumber = "+$countryCode $phone";

      //final response = authRepository.checkUser(phoneNumber);

      //print("response login $response & phonenumber $phone");

      //Constants.isNewUser = response == 0;
      authRepository.signInWithOtp(phoneNumber).then((value) {
        Navigator.pushNamed(context, AppRoutes.sendOtpScreen, arguments: {"phoneNumber": phoneNumber});
      });
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }

  Future<void> submit(String otpValue, String phoneNumber, BuildContext context) async {
    EasyLoading.show(status: "Loading...");
    authRepository.verifyOtp(otpValue, phoneNumber).then((value) {

        print("user ${value.user?.id}");
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.splashScreen, (route) => true);

      EasyLoading.dismiss();
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
      EasyLoading.showInfo("Please check otp or resend otp");
    });
  }

  Future<void> register(String userNameController, String emailController, String dateController, String selectedGender, String stateController, String cityController, String phoneNumber, BuildContext context) async {

    EasyLoading.show(status: "Loading...");
    authRepository.registerUser({
      'id': Constants.authKey,
      'full_name': userNameController,
      'email': emailController,
      'date_of_birth': dateController,
      'gender': selectedGender,
      'state': stateController,
      'city': cityController,
      'phone': phoneNumber
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
