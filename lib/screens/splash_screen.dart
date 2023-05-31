import 'package:consultation_curegal/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../consatant/ColorConstant.dart';
import '../consatant/Constants.dart';
import '../utility/utility.dart';

class SplashScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        Future.delayed(Duration(seconds: 3), () async {
          if (Constants.supabaseClient.auth.currentUser?.id != null) {
            Navigator.pushNamedAndRemoveUntil(context, AppRoutes.homeScreen, (route) => true);
          } else {
            //Navigator.pushNamed(context, AppRoutes.splashScreen);
            Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
          }
        });
        return null;
      },[]
    );

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
