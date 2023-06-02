import 'dart:developer';

import 'package:consultation_curegal/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../consatant/ColorConstant.dart';
import '../consatant/Constants.dart';
import '../shared/controller/user_profile.dart';
import '../utility/utility.dart';

class SplashScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {


    useEffect(() {

      EasyLoading.instance.maskType = EasyLoadingMaskType.black;
      EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.pulse;
      if(Constants.supabaseClient.auth.currentUser?.id != null){
        (ref.read(userProfileProvider).toString());

        Future.delayed(Duration(seconds: 2),() {
          Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
        },);
      }
      else
        {
          Future.delayed(Duration(seconds: 0),() {
            Navigator.pushNamedAndRemoveUntil(context, AppRoutes.loginScreen, (route) => true);
          },);

        }
    },);

    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: Material(
        type: MaterialType.transparency,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          child: Container(
            decoration: const BoxDecoration(color: CustomColor.primaryPurple),
            child: Center(
              child: Text(
                tr(context).curegal,
                style: TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "productsun"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
