


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../consatant/ColorConstant.dart';
import '../../../routing/app_routes.dart';
import '../../../shared/shared_small_widgets.dart';

class DoctorDetailCard extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.consultationAppointmentScreen);
      },
      child: Card(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: CustomColor.lightGray,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/doctor.png",
                  height: MediaQuery.of(context).size.height / 9,
                ),
                SizedBox(
                  width: 7,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dr. Lane Holden",
                            style: TextStyle(
                                color: CupertinoColors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "productsun",
                                fontSize: 14),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("General Practitioner",
                              style: TextStyle(
                                  color: CustomColor.mediumGray,
                                  fontFamily: "productsun",
                                  fontSize: 13)),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/experince.png",
                                height: 10,
                                width: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("3 Year +",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: CustomColor.black,
                                      fontFamily: "productsun")),
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                "assets/images/experince.png",
                                height: 10,
                                width: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("MA PGDCA",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: CustomColor.black,
                                      fontFamily: "productsun")),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/experince.png",
                                height: 10,
                                width: 10,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("English, Gujrati, Hindi, Katchhi, Marathi",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: CustomColor.black,
                                      fontFamily: "productsun")),
                            ],
                          ),
                        ],
                      ),
                      CommonRating(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        flag: true,
                      ),
                    ],
                  ),
                ),
                //CachedNetworkImage(imageUrl: 'assets/Rectangle100228.png',)

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 13, top: 5),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(color: Color(0x128377EC),shape: BoxShape.circle,),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(
                      Icons.access_time,
                      color: CustomColor.mediumPurple,
                      size: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text("Available in 60 minutes",
                    style: TextStyle(
                        color: CustomColor.mediumGreen,
                        fontFamily: "productsun",
                        fontSize: 13)),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Consult Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Total Fee  \$99",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            color: Color(0xff8377ec),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          )
        ]),
      ),
    );
  }
}