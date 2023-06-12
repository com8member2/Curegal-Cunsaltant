import 'package:consultation_curegal/consatant/ColorConstant.dart';
import 'package:consultation_curegal/routing/app_routes.dart';
import 'package:consultation_curegal/screens/home_screen/presentation/home_tab/widget/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../../shared/controller/user_profile.dart';

class HomeTabScreen extends HookConsumerWidget {
  const HomeTabScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = getProfileCompletionPerValue(ref);
    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 7),
        width: 120,
        height: 50,
        child: FloatingActionButton(
            heroTag: "available",
            shape: StadiumBorder(),
            backgroundColor: CustomColor.white,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.consultantAvailability);
            },
            child: const Text(
              "Availability",
              style: TextStyle(fontSize: 16, color: CustomColor.darkPurple),
            )),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(ref.watch(userProfileProvider).approveStatus ?? "In Review"),
              const SizedBox(
                width: 15,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                        value: value,
                        color: CustomColor.primaryPurple,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${(value * 100).toStringAsFixed(0)} %"),
                  )
                ],
              )
            ],
          ),
        ),
        CalendarView()
      ]),
    );
  }

  double getProfileCompletionPerValue(WidgetRef ref) {
    var user = ref.watch(userProfileProvider);
    double progress = 0.0;
    if (user.name?.isNotEmpty ?? false) {
      progress = progress + 0.2;
    }
    if (user.consultantPersonType != null) {
      progress = progress + 0.2;
    }
    if (user.documentationStatus ?? false) {
      progress = progress + 0.2;
    }
    if (user.educationExperienceStatus ?? false) {
      progress = progress + 0.2;
    }
    if (user.consultationLanguageStatus ?? false) {
      progress = progress + 0.2;
    }
    return progress;
  }
}
