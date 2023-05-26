

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../consatant/ColorConstant.dart';
import '../shared/custom_button.dart';
import '../shared/custom_image_view.dart';
import '../utility/utility.dart';

class MedicineDetail extends StatelessWidget {
  const MedicineDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.lightink,
      appBar:  AppBar(
        backgroundColor: CustomColor.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Medicine Details",
              style: TextStyle(
                  fontFamily: "productsun", fontSize: 18.0, decoration: TextDecoration.none, color: CustomColor.black, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(
              Icons.info_outline,
              color: CustomColor.mediumGray,
              size: 20,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.share, color: CustomColor.mediumGray, size: 20),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.favorite_border, color: CustomColor.mediumGray, size: 20),
          ],
        ),
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        leading: GestureDetector(onTap: () => Navigator.pop(context),child: Icon(Icons.arrow_back_ios, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                color: CustomColor.white,
                height: MediaQuery.of(context).size.height / 2.6,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width,
                      // Set the width to 80% of the screen width
                      color: Color(0xFFF5F8FE),
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deliver to',
                            style: TextStyle(fontSize: 16.0, fontFamily: "productsun"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          DropdownButton<String>(
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 30,
                            ),
                            value: '394210 Surat',
                            onChanged: (value) {},
                            items: <String>['394210 Surat', '394213 Surat', '394211 Surat', '394212 Surat']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Himalaya Bresol Tabletes 60",
                                  style: TextStyle(color: CustomColor.black, fontWeight: FontWeight.w300, fontSize: 16, fontFamily: "productsun")),
                              SizedBox(
                                height: 5,
                              ),
                              Text("By NITRO ORGANICS PVT LTD", style: TextStyle(color: CustomColor.txtGray, fontSize: 14, fontFamily: "productsun")),
                              SizedBox(
                                height: 10,
                              ),
                              Text("10 CAPSULE(S) IN STRIP",
                                  style: TextStyle(color: CustomColor.black, fontWeight: FontWeight.w100, fontSize: 16, fontFamily: "productsun")),
                              SizedBox(
                                height: 20,
                              ),
                              Text("Delivery by 05 May-07 May", style: TextStyle(color: CustomColor.black, fontSize: 16, fontFamily: "productsun")),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '7 Days return policy ',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: CustomColor.txtGray,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Read More',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: CustomColor.mediumPurple,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Do something when the text is clicked
                                        },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          CustomImageView(imagePath:  "assets/images/961.png",
                            height: MediaQuery.of(context).size.height / 7,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right : 15),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("MRP \$122.11", style: TextStyle(color: CustomColor.txtGray, fontSize: 16, fontFamily: "productsun")),
                              SizedBox(
                                height: 5,
                              ),
                              Text("\$99.9",
                                  style: TextStyle(color: CustomColor.rxtBlue, fontWeight: FontWeight.bold, fontSize: 18, fontFamily: "productsun")),
                              SizedBox(
                                height: 5,
                              ),
                              Text("(Inclusive of all texes)", style: TextStyle(color: CustomColor.txtGray, fontSize: 12, fontFamily: "productsun")),
                            ],
                          ),
                          Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.8,
                            height: MediaQuery.of(context).size.height / 18,
                            child: ElevatedButton(
                              onPressed: () {
                                // Do something when the button is pressed
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(CustomColor.primaryPurple),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              child: Text('Add To Cart'),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Container(
                    color: CustomColor.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                        height: MediaQuery.of(context).size.height / 6.5,
                        decoration: BoxDecoration(
                          color: CustomColor.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: CustomColor.mediumPurple, // purple border color
                            width: 1.0,
                          ),
                        ),
                        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Flate 15% off + additional Rs. 150 off",
                                    style: TextStyle(
                                        wordSpacing: 0.5,
                                        fontFamily: "productsun",
                                        fontSize: 16.0,
                                        decoration: TextDecoration.none,
                                        color: CustomColor.black,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("coupon applicable on order above Rs. 1499...",
                                    style: TextStyle(
                                        fontFamily: "productsun",
                                        fontSize: 14.0,
                                        decoration: TextDecoration.none,
                                        color: CustomColor.txtGray,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 15,
                              child: CustomButton(
                                  CustomColor.primaryPurple, CustomColor.secondPrimaryPurple, "OFF150", () {}, 30, 1, MediaQuery.of(context).size.width / 3))
                        ]),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    top: 13,
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      color: CustomColor.white,
                      child: Text(
                        "ADDITIONAL OFFER",
                        style: TextStyle(
                            wordSpacing: 0.9, color: CustomColor.primaryPurple, fontWeight: FontWeight.bold, fontSize: 12, fontFamily: "productsun"),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Container(
                      color: CustomColor.white,
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, right: 10, top: 20),
                                child: Text(
                                  "Related Medicine",
                                  style: TextStyle(
                                      wordSpacing: 5, color: CustomColor.black, fontWeight: FontWeight.bold, fontSize: 18, fontFamily: "productsun"),
                                ),
                              ),
                              GridView.count(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.5),
                                children: List.generate(
                                  2,
                                  (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MedicineDetail()));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8.0, top: 10),
                                        child: Card(
                                            elevation: 0,
                                            borderOnForeground: true,
                                            // optional, set to true to show the border on top of the card
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
                                              side: BorderSide(
                                                width: 2, // set the border width
                                                color: CustomColor.secondPrimaryPurple, // set the border color
                                              ),
                                            ),
                                            color: CustomColor.lightBlue,
                                            child: Column(children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      alignment: Alignment.center,
                                                      // Set height to 63 pixels
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(31), // Set border radius to 31 pixels
                                                        color: Color(0xFF03C379), // Set background color to #03C379
                                                      ),
                                                      child: SizedBox(
                                                        width: MediaQuery.of(context).size.width / 7, // Set width to 50% of screen width
                                                        height: MediaQuery.of(context).size.height / 34,
                                                        child: Center(
                                                          child: Text(
                                                            '20% OFF',
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              overflow: TextOverflow.ellipsis,
                                                              color: Colors.white, // Set text color to white
                                                              fontSize: 10, // Set text font size
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    CustomImageView(imagePath: "assets/images/favourite.png",
                                                      height: 20,
                                                      width: 20,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                             CustomImageView(imagePath: "assets/images/961.png",
                                                  height: MediaQuery.of(context).size.height / 10, width: 100, fit: BoxFit.scaleDown),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10.0, right: 10),
                                                child: Text(
                                                  "Himalaya Bresol Tabletes 60",
                                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                                  maxLines: 2,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10.0),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "\$99.9",
                                                      style: TextStyle(
                                                          color: CustomColor.rxtBlue,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 16,
                                                          fontFamily: "productsun"),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "\$122.11",
                                                      style: TextStyle(
                                                          decoration: TextDecoration.lineThrough,
                                                          color: CustomColor.txtGray,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14,
                                                          fontFamily: "productsun"),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(left: 10, right: 10),
                                                height: 35.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFE9EFFB),
                                                  borderRadius: BorderRadius.circular(20.0),
                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // Handle button press here
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      'Add to Cart',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 14.0,
                                                          color: CustomColor.rxtBlue,
                                                          fontFamily: "productsun"),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ])),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}


