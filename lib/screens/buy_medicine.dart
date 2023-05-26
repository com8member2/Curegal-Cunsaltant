
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../consatant/ColorConstant.dart';
import '../shared/custom_image_view.dart';
import '../shared/shared_small_widgets.dart';
import '../utility/utility.dart';
import 'medicine_detail.dart';

class BuyMedicine extends HookWidget {
  const BuyMedicine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.white,
      appBar: customAppBarH("Medicine", context,CustomColor.primaryPurple,Colors.white,true),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/12,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF8F8F8),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              )
            ),
            SizedBox(height: 10,),
            Expanded(
              child: GridView.count(
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.5),
                crossAxisCount: 2,
                children: List.generate(
                  100, // Replace this with the number of cards you want to display
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MedicineDetail()));
                      },
                      child: Card(
                        elevation: 0,
                          borderOnForeground: true, // optional, set to true to show the border on top of the card
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
                              padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
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
                                      width: MediaQuery.of(context).size.width/7, // Set width to 50% of screen width
                                      height: MediaQuery.of(context).size.height/34,
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
                                  CustomImageView(imagePath: "assets/images/favourite.png",height: 20,width: 20,)
                                ],
                              ),
                            ),
                            SizedBox(height: 5,),
                            CustomImageView(imagePath:"assets/images/961.png",height: MediaQuery.of(context).size.height/10,width: 100,fit: BoxFit.scaleDown),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0,right: 10),
                              child: Text("Himalaya Bresol Tabletes 60",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),maxLines: 2,),
                            ),
                            SizedBox(height: 7,),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(children: [
                                Text("\$99.9",style: TextStyle(color: CustomColor.rxtBlue,fontWeight: FontWeight.bold,fontSize: 16,fontFamily: "productsun"),),
                                SizedBox(width: 10,),
                                Text("\$122.11",style: TextStyle(decoration: TextDecoration.lineThrough,color: CustomColor.txtGray,fontWeight: FontWeight.bold,fontSize: 14,fontFamily: "productsun"),),
                              ],),
                            ),
                            SizedBox(height: 12,),
                            Container(
                              margin: EdgeInsets.only(left: 10,right: 10),
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
                                    style: TextStyle(fontWeight:FontWeight.bold,fontSize: 14.0,color: CustomColor.rxtBlue,fontFamily: "productsun"),
                                  ),
                                ),
                              ),
                            )

                          ])),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}