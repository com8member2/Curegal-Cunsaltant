import 'package:consultation_curegal/consatant/Constants.dart';
import 'package:consultation_curegal/routing/app_routes.dart';
import 'package:consultation_curegal/screens/account/presentation/language_selection_screen.dart';

import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../consatant/ColorConstant.dart';

import '../../../shared/widget/shared_small_widgets.dart';
import 'consultation_doctor_type_sub_screen.dart';

class ConsultationType extends HookWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final radioValue = useState('');
    List<Map<String, dynamic>> consultationTypes = [
      {'title': tr(context).doctor, 'icon': Icons.person,'desc' : tr(context).doctor_desc},
      {'title': tr(context).wellness_coach, 'icon': Icons.person,'desc' : tr(context).wellness_coach_desc},
      {'title': tr(context).trainer, 'icon': Icons.person,'desc' : tr(context).trainer_desc},
      // Add more options as needed
    ];

    return Scaffold(
      appBar: customAppBarH("Consultation Type", context),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only( left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    screenHeadingSubtitle(tr(context).consultation_type_screen_heading, tr(context).consultation_type_screen_heading),
                    SizedBox(height: 30,),
                    ...consultationTypes.map((type) {
                      return CardListViewDesign(
                        customWidget: Row(
                          children: [
                            Flexible(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Center(child: Icon(type['icon'], size: 30, color: CustomColor.txtGray)),
                              ),
                            ),
                            Flexible(
                              flex: 8,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 0, right: 8, top: 15, bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      type['title'],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: false,
                                      style: commonTextStyle(context, 16),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0, right: 0, top: 7),
                                      child: Text(
                                        type['desc'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: CustomColor.txtGray, fontSize: 13),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Radio<String>(
                                value: type['title'],
                                groupValue: radioValue.value,
                                onChanged: (value) async {
                                  radioValue.value = value!;
                                  if(type['title'] == tr(context).doctor){

                                    var res = await Constants.supabaseClient.
                                        from('consultation_category')
                                        .select("name")
                                        .execute();

                                    print("name ${res.data as List<dynamic>}");

                                   Navigator.pushNamed(context, AppRoutes.doctorConsultationSubTypeScreen);
                                  }
                                },
                                activeColor: CustomColor.primaryPurple,
                              ),
                              flex: 3,
                            ),
                          ],
                        ),
                        onClick: () {},
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          ),
          // Positioned(
          //     child: Container(
          //         padding: const EdgeInsets.only(top: 40),
          //         child: CommonBottomAlignWidget(
          //           setBottomWidget: CustomButton(CustomColor.white, CustomColor.primaryPurple, tr(context).submit, () {
          //             print("object ${radioValue.value}");
          //
          //           }, 10, 1, MediaQuery.of(context).size.width),
          //         ))),
        ],
      ),
    );
  }
}

// import 'package:consultation_curegal/routing/app_routes.dart';
// import 'package:consultation_curegal/shared/shared_small_widgets.dart';
// import 'package:consultation_curegal/utility/utility.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
//
// import '../../consatant/ColorConstant.dart';
// import '../../shared/account_setting_card_child_widget.dart';
// import '../../shared/common_bottom_align.dart';
// import '../../shared/custom_button.dart';
//
// class ConsultationType extends HookWidget {
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final consultationTypes = ['Doctor', 'Well Coach', 'Trainer'];
//   late String selectedConsultationType;
//
//   @override
//   Widget build(BuildContext context) {
//     final radioValue = useState('');
//
//     return Scaffold(
//       appBar: customAppBarH("Consultation Type", context,CustomColor.primaryPurple, CustomColor.white),
//       body:  Stack(
//         children: [
//           SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 50.0,left: 20),
//                 child:Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CardListViewDesign(
//                       onClick: () {
//                         Navigator.pushNamed(context, AppRoutes.userProfileScreen);
//                       },
//                       customWidget: commonCardChildView(
//                           context: context,
//                           image: Icons.person,
//                           title: "Doctor",
//                           description: "It is a personal account or representation of the user within the app ecosystem."),
//                     ),
//                     const SizedBox(height: 10),
//                     CardListViewDesign(
//                         onClick: () {
//                           Navigator.pushNamed(context, AppRoutes.consultationCategory);
//                         },
//                         customWidget :  Row(
//                           children: [
//                           Flexible(
//                           flex: 3,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 0),
//                             child: Center(
//                                 child: Icon(Icons.person, size: 30, color: CustomColor.txtGray)),
//                           ),
//                         ),
//                         Flexible(
//                           flex: 8,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 0, right: 8, top: 15, bottom: 15),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.stretch,
//                               children: [
//                                 Text(
//                                   "Wellness Coach",
//                                   overflow: TextOverflow.ellipsis,
//                                   maxLines: 1,
//                                   softWrap: false,
//                                   style: commonTextStyle(context, 16),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 0, right: 0, top: 7),
//                                   child: Text(
//                                     "These categories help categorize and organize the various topics or fields for which individuals or businesses can seek professional guidance or advice. ",
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(color: CustomColor.txtGray, fontSize: 13),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                         const Flexible(
//                           flex: 3,
//                           child: Padding(
//                             padding: EdgeInsets.only(left: 0),
//                             child: Center(
//                               child:
//                             ),
//                           ),
//                           ],
//                         )
//                     ),
//                     const SizedBox(height: 10),
//                     CardListViewDesign(
//                       onClick: () {},
//                       customWidget: commonCardChildView(
//                           context: context,
//                           image: Icons.person,
//                           title: "Trainer",
//                           description:
//                           "identification document or ID document, is an official form of identification that serves to establish a person's identity. It is typically issued by a government authority and contains important personal information about the individual."),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//               child: Container(
//                   padding: const EdgeInsets.only(top: 40),
//                   child: CommonBottomAlignWidget(
//                     setBottomWidget: CustomButton(CustomColor.white, CustomColor.primaryPurple, tr(context).submit, ()  {
//
//                       print("object ${radioValue.value}");
//                       Navigator.pushNamed(context, AppRoutes.registerScreen);
//
//                     }, 10, 1, MediaQuery.of(context).size.width),
//                   ))),
//         ],
//       ),
//     );
//   }
// }
//
