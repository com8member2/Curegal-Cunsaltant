import 'package:consultation_curegal/routing/app_routes.dart';
import 'package:consultation_curegal/shared/widget/shared_small_widgets.dart';
import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../shared/widget/account_setting_card_child_widget.dart';

class ConsultationType extends HookWidget {
  const ConsultationType({super.key});


  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> consultationTypes = [
      {'title': tr(context).doctor, 'icon': Icons.person, 'desc': tr(context).doctor_desc},
      {'title': tr(context).wellness_coach, 'icon': Icons.person, 'desc': tr(context).wellness_coach_desc},
      {'title': tr(context).trainer, 'icon': Icons.person, 'desc': tr(context).trainer_desc},
      // Add more options as needed
    ];

    return Scaffold(
      appBar: customAppBarH("Consultation Type", context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              screenHeadingSubtitle(tr(context).consultation_type_screen_heading, tr(context).consultation_type_screen_heading),
              const SizedBox(
                height: 10,
              ),
              ...consultationTypes.map((type) {
                return
                  CardListViewDesign(
                    edgeInsets: EdgeInsets.only(top: 20, bottom: 4),
                    onClick: () {
                      if (type['title'] == tr(context).trainer) {
                        Navigator.pushReplacementNamed(context, AppRoutes.doctorConsultationSubTypeScreen, arguments: 1);
                      } else if (type['title'] == tr(context).wellness_coach) {
                        Navigator.pushReplacementNamed(context, AppRoutes.doctorConsultationSubTypeScreen, arguments: 2);
                      } else if (type['title'] == tr(context).doctor) {
                        Navigator.pushReplacementNamed(context, AppRoutes.doctorConsultationSubTypeScreen, arguments: 3);
                      }
                    },
                    customWidget: commonCardChildView(
                      context: context,
                      image: Icons.person,
                      title: type['title'],
                      description: type['desc'],)
                  );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}