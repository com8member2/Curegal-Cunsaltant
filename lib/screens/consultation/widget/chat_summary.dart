

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../consatant/ColorConstant.dart';
import '../../../routing/app_routes.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_image_view.dart';
import '../../../shared/shared_small_widgets.dart';

class ChatSummary extends HookWidget {
  const ChatSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.white,
      appBar: customAppBarH("Summary", context,CustomColor.white,Colors.black,true),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10,bottom: 20,top: 20),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: Card(
                  elevation: 0,
                  color: CustomColor.lightGray100,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 15,
                          child: Card(
                              elevation: 0,
                              color: CustomColor.secondPrimaryPurple,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0, right: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Prescription",
                                      style: TextStyle(
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.bold,
                                          color: CustomColor.black,
                                          fontSize: 14,
                                          decoration: TextDecoration.none,
                                          fontFamily: "productsun"),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.file_download_outlined,
                                      color: CustomColor.primaryPurple,
                                    ),
                                    Text(
                                      "Download",
                                      style: TextStyle(fontFamily: "productsun", color: CustomColor.primaryPurple, decoration: TextDecoration.none, fontSize: 14),
                                    )
                                  ],
                                ),
                              ) // your child widget(s) go here
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "PROBABLE DIAGNOSIS",
                          style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                              color: CustomColor.mediumGray,
                              fontSize: 14,
                              decoration: TextDecoration.none,
                              fontFamily: "productsun"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Cold and growing pains",
                          style: TextStyle(
                              letterSpacing: 0.5, color: CustomColor.black, fontSize: 18, decoration: TextDecoration.none, fontFamily: "productsun"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          height: 1,
                          color: CustomColor.darkGray,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "MEDICINES",
                          style: TextStyle(
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                              color: CustomColor.mediumGray,
                              fontSize: 14,
                              decoration: TextDecoration.none,
                              fontFamily: "productsun"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(imagePath:"assets/images/vector.png", height: 20, width: 20),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ibugesic Plus Suspension 100ml",
                                  style: TextStyle(color: CustomColor.black, fontSize: 18, decoration: TextDecoration.none, fontFamily: "productsun"),
                                ),
                                Text(
                                  "Twice a day (Morning and Night) 30 Days",
                                  style:
                                      TextStyle(color: CustomColor.mediumGray, fontSize: 16, decoration: TextDecoration.none, fontFamily: "productsun"),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(imagePath: "assets/images/vector.png", height: 20, width: 20),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Calcimax D Suspension 200ml",
                                  style: TextStyle(color: CustomColor.black, fontSize: 18, decoration: TextDecoration.none, fontFamily: "productsun"),
                                ),
                                Text(
                                  "Twice a day (Morning and Night) 60 Days",
                                  style:
                                      TextStyle(color: CustomColor.mediumGray, fontSize: 16, decoration: TextDecoration.none, fontFamily: "productsun"),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(imagePath: "assets/images/vector.png", height: 20, width: 20),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Montair 5mg Tablet 10'S",
                                  style: TextStyle(color: CustomColor.black, fontSize: 18, decoration: TextDecoration.none, fontFamily: "productsun"),
                                ),
                                Text(
                                  "Once a day (Night) 7 Days",
                                  style:
                                      TextStyle(color: CustomColor.mediumGray, fontSize: 16, decoration: TextDecoration.none, fontFamily: "productsun"),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ) // your child widget(s) go here
                  ),
            ),
            Spacer(),
            CustomButton(CustomColor.white, CustomColor.primaryPurple, "Order Medicine", () {
              Navigator.pushNamed(context, AppRoutes.buyMedicineScreen);
            }, 10, 1, MediaQuery.of(context).size.width)
          ],
        ),
      ),
    );
  }
}
