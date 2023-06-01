
import 'dart:developer';

import 'package:consultation_curegal/shared/controller/user_profile.dart';
import 'package:consultation_curegal/shared/model/user_entity.dart';
import 'package:consultation_curegal/consatant/Constants.dart';
import 'package:consultation_curegal/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../consatant/ColorConstant.dart';
import '../../account/presentation/account_setting.dart';
import '../../account/presentation/consultant_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../../../consatant/Constants.dart';
import '../../../routing/app_routes.dart';
import '../../../utility/utility.dart';


class HomeScreen extends HookConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var index=useState(1);
    return SafeArea(
      child: Scaffold(
        body: _getBody(index.value,context),
        bottomNavigationBar: BottomNavigationBar(currentIndex: index.value,
            selectedItemColor: CustomColor.white,
            backgroundColor: CustomColor.primaryPurple,
            unselectedItemColor: CustomColor.whiteLight,
            onTap: (value) {
              index.value = value;
            },
            items: [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(width: 20, height: 20, child: Image.asset('assets/images/home.png')),
                  ),
                  label: "Home"),
              // BottomNavigationBarItem(
              //     icon: Padding(
              //       padding: const EdgeInsets.all(10),
              //       child: SizedBox(width: 24, height: 24, child: Image.asset('assets/images/track_period.png')),
              //     ),
              //     label: "Track Period"),
              /*BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Health"),
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Chatbot"),*/
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(width: 20, height: 20, child: Image.asset('assets/images/account.png')),
                  ),
                  label: "Account"),
            ]),
      ),
    );
  }

  Widget _getBody(int index,BuildContext context) {
    switch (index) {
      case 0:
        return Container();
      case 1:
        return AccountSettingsScreen();
    }
    return Center(child: Text("There is no page builder for this index."),);
  }

}
