import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../consatant/ColorConstant.dart';
import '../../../../consatant/Constants.dart';
import '../../../../routing/app_routes.dart';
import '../../../../shared/shared_small_widgets.dart';
import '../../../../utility/utility.dart';
import '../widget/Lab_test_view.dart';
import '../widget/common_horizontal_list.dart';
import '../widget/consultation_category.dart';
import '../widget/doctors_category.dart';
import '../widget/more_consultation_category.dart';
import '../widget/news_&_articles.dart';
import '../widget/tip_of_the_day.dart';

class HomeTabScreen extends HookConsumerWidget {
  const HomeTabScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 18),
                child: Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Constants.supabaseClient.auth.signOut().then(
                                    (value) {
                                      //Navigator.pushNamed(context, AppRoutes.consultationProfileScreen);
                                    },
                                  );
                                },
                                child: const Text("Hi! Angelina", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold))),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Icon(Icons.location_on_rounded, color: Colors.pink, size: 20),
                                const SizedBox(width: 7),
                                const Text("Surat, Gujarat 395556", style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.consultationProfileScreen);
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  value: 0.5,
                                  strokeWidth: 6.0,
                                  backgroundColor: CustomColor.gray,
                                  valueColor: AlwaysStoppedAnimation<Color>(CustomColor.primaryPurple),
                                ),
                              ),
                              Text("${profileStatus().toString()}%" ,style: commonTextStyle(context, 12),)
                            ],
                          ),
                        ),
                      ],
                    )),
                    /*IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_rounded)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),*/
                  ],
                ),
              ),
              const TipOfTheDay(),
              const DividerLightPink(),
              ConsultationCategory(tr(context).consultation_category),
              const DividerLightPink(),
              DoctorsCategory(tr(context).doctor_category, (index) {}),
              const DividerLightPink(),
              MoreConsultationCategory(tr(context).more_consultations),
              const DividerLightPink(),
              // CommonHorizontalList(false,tr(context).live_classes,"","",""),
              //const DividerLightPink(),
              const NewsAndArticles(),
              const SizedBox(height: 25),
              /*const DividerLightPink(),
              LabTestView(tr(context).lab_test)*/
            ],
          ),
        ),
      ),
    );
  }


  profileStatus()  {
     int? value = 10;

    return value;
  }

}
