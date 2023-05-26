
import 'package:consultation_curegal/screens/home_screen/presentation/tabs/home_tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../consatant/ColorConstant.dart';
import '../../account/presentation/account_setting.dart';
import '../../account/presentation/consultant_profile.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var index=useState(0);

    return SafeArea(
      child: Scaffold(
        body: _getBody(index.value),
        bottomNavigationBar: BottomNavigationBar(
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
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(width: 24, height: 24, child: Image.asset('assets/images/track_period.png')),
                  ),
                  label: "Track Period"),
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

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return HomeTabScreen();
      case 1:
        return HomeTabScreen();
      case 2:
        return AccountSettingsScreen();
    }
    return Center(child: Text("There is no page builder for this index."),);
  }

}
