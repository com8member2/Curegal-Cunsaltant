import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../consatant/ColorConstant.dart';
import '../../account/presentation/account_setting.dart';
import 'home_tab/home_tab_screen.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var index = useState(0);
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: index.value,
          children: const [HomeTabScreen(), AccountSettingsScreen()],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: index.value,
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

}
