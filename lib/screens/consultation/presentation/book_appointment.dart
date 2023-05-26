
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../consatant/ColorConstant.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_image_view.dart';
import '../../../shared/shared_small_widgets.dart';
import '../../../utility/utility.dart';
import '../../home_screen/presentation/widget/custom_textfield.dart';
import '../widget/dialog_medicine.dart';

class BookApointment extends HookWidget {
  const BookApointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedChipIndex = useState(0);
    final isSelected = useState(true);

    void _onChipSelected(int index) {
      selectedChipIndex.value = index;
    }

    return Scaffold(
      appBar: customAppBarH("Appointment", context, CustomColor.white, Colors.black,true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10,bottom: 10),
              alignment: Alignment.center,
              color: CustomColor.white,
              child: Column(children: [
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: CustomColor.lightGray,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: "assets/images/Rectangle100228.png",
                            height: MediaQuery.of(context).size.height / 9,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dr. Lane Holden",
                                    style: TextStyle(color: CupertinoColors.black, fontWeight: FontWeight.bold, fontFamily: "productsun", fontSize: 14),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    child: Text("General Practitioner", style: TextStyle(color: CustomColor.mediumGray, fontFamily: "productsun", fontSize: 13)),
                                  ),
                                  Row(
                                    children: [
                                      CustomImageView(
                                        imagePath: "assets/images/experince.png",
                                        height: 10,
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("3 Year +",
                                          style:
                                              TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: CustomColor.black, fontFamily: "productsun")),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10,right: 5),
                                        child: CustomImageView(
                                          imagePath: "assets/images/experince.png",
                                          height: 10,
                                          width: 10,
                                        ),
                                      ),
                                      Text("MA PGDCA",
                                          style:
                                              TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: CustomColor.black, fontFamily: "productsun")),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: [
                                      CustomImageView(
                                        imagePath: "assets/images/experince.png",
                                        height: 10,
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Flexible(
                                        child: Text("English, Gujrati, Hindi, Katchhi, Marathi",
                                            style:
                                                TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: CustomColor.black, fontFamily: "productsun")),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, left: 13, top: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: CustomColor.mediumPurple,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Available in 60 minutes", style: TextStyle(color: CustomColor.mediumGreen, fontFamily: "productsun", fontSize: 13)),
                        ],
                      ),
                    ),
                  ]),
                ),
                Card(
                  elevation: 0,
                  child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: CustomColor.mediumPurple,
                            ),
                            Text(
                              "28 St, New York city",
                              style: TextStyle(color: CustomColor.mediumPurple),
                            ),
                          ],
                        ),
                      )),
                  color: CustomColor.secondPrimaryPurple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                )
              ]),
            ),
            DividerLightPink(),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              color: CustomColor.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    padding:  const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomColor.mediumPurple,
                        width: 0.3,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Row(children: [
                        Text("Doctor's fee", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, fontFamily: "productsun")),
                        Spacer(),
                        Text("\$99", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "productsun"))
                      ]),
                      SizedBox(
                        height: 30,
                      ),
                      Text("I have a offer code", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "productsun")),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 19,
                        child: TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(top: 5.0, bottom: 5, right: 5),
                              child: TextButton(style: ButtonStyle(shape: MaterialStatePropertyAll(StadiumBorder()),backgroundColor: MaterialStateProperty.all(CustomColor.primaryPurple)),
                                onPressed: () {},
                                child: Text(
                                  'Apply',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            hintText: "Apply Coupon code",
                            border: OutlineInputBorder(borderSide: BorderSide(color: CustomColor.mediumPurple,width: 1),borderRadius: BorderRadius.circular(15)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: CustomColor.mediumPurple,width: 1),borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: CustomColor.mediumPurple,width: 1),borderRadius: BorderRadius.circular(15)),
                            contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                          ),
                        ),
                      ),
                      Divider(
                        height: 30,
                        color: CustomColor.mediumPurple,
                      ),
                      Row(
                        children: [
                          Text(
                            "Total Amount",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, fontFamily: "productsun"),
                          ),
                          Spacer(),
                          Text(
                            "-\$ 80",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, fontFamily: "productsun"),
                          )
                        ],
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Text("Book Appointment For", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "productsun")),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: DropdownButtonFormField(
                        value: 1, // set the default selected value to "Option 1"
                        items: [
                          DropdownMenuItem(
                            child: Text('Your Self'),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text('Your Self'),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text('Your Self'),
                            value: 3,
                          ),
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        ),
                        onChanged: (value) {
                          // Do something with the selected value
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10,top: 20,bottom: 5),
                    child: Text("Danielle Ray", style: TextStyle(fontSize: 16, fontFamily: "productsun")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10,bottom: 20),
                    child: Text("+91(123-4536789 )", style: TextStyle(fontSize: 14, fontFamily: "productsun")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10,bottom: 20),
                    child: Text("* This Contact number Will be used by the doctor to connect with petient",
                        style: TextStyle(fontSize: 17, fontFamily: "productsun", color: CustomColor.primaryPurple)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 15),
                    child: CustomButton(CustomColor.white, CustomColor.primaryPurple, "Confirm", () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AddFamilyDialogBox();
                        },
                      );
                    }, 10, 1, MediaQuery.of(context).size.width),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
