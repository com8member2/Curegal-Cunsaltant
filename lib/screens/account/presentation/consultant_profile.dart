import 'package:cached_network_image/cached_network_image.dart';
import 'package:consultation_curegal/consatant/ColorConstant.dart';
import 'package:consultation_curegal/shared/custom_button.dart';
import 'package:consultation_curegal/shared/custom_dropdown.dart';
import 'package:consultation_curegal/shared/shared_small_widgets.dart';
import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../shared/common_bottom_align.dart';
import '../../../shared/textfield_decoration.dart';
import '../../authentication/Controller/auth_controller.dart';
import '../controller/profile_controller.dart';

class ConsultationProfile extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    var selectedGender = useState("male");
    final formKey = useMemoized(() => GlobalKey<FormState>(), []);
    final List<String> city = ["Rajkot", "Ahemdabad", "Surat"];
    final List<String> state = ["Gujrat", "Rajshthan", "MP"];
    final List<String> gender = ["Male", "Female", "Other"];

    var nameController = useTextEditingController();
    var emailController = useTextEditingController();
    var phoneNumberController = useTextEditingController();
    var dobController = useTextEditingController();
    var genderController = useTextEditingController();
    var languageController = useTextEditingController();
    var countryController = useTextEditingController();
    var stateController = useTextEditingController();
    var cityController = useTextEditingController();
    var consultantPriceController = useTextEditingController();

    return Scaffold(
      backgroundColor: CustomColor.white,
      appBar: AppBar(
        title: Text("Profile"),
        actions:  [
          Row(children: [
            SizedBox(height: 50,
              width: MediaQuery.of(context).size.width/3,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  side: BorderSide(width: 2, color: Colors.transparent),
                  backgroundColor: CustomColor.blue,
                  foregroundColor: CustomColor.primaryPurple,
                  padding: const EdgeInsets.all(10.0),
                ),
                onPressed: () {

                },
                child: Text(
                  tr(context).family_member,
                  style: const TextStyle(fontFamily: "productsun", fontWeight: FontWeight.bold,fontSize: 14),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10),
              child: SizedBox(height: 50,
                width: MediaQuery.of(context).size.width/5,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    side: BorderSide(width: 2, color: Colors.transparent),
                    backgroundColor: CustomColor.primaryPurple,
                    foregroundColor: CustomColor.white,
                    padding: const EdgeInsets.all(10.0),
                  ),
                  onPressed: () {

                  },
                  child: Text(
                    tr(context).save,
                    style: const TextStyle(fontFamily: "productsun", fontWeight: FontWeight.bold,fontSize: 14),
                  ),
                ),
              ),
            )
          ],)
        ],
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height/10,
        backgroundColor: CustomColor.white,
        titleTextStyle: TextStyle(color: CustomColor.black, fontSize: 20, fontWeight: FontWeight.bold),
        leading:  GestureDetector(onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back_ios, color: CustomColor.black)) ,
      ),

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 15.0, right: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(500.0),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    errorWidget: (context, url, error) => Image.asset(
                                      "assets/images/image_not_found.jpg",
                                      height: 100,
                                      width: 100,
                                      alignment: Alignment.bottomCenter,
                                    ),
                                    placeholder: (context, url) => Image.asset(
                                      "assets/images/image_not_found.jpg",
                                      height: 100,
                                      width: 100,
                                      alignment: Alignment.bottomCenter,
                                    ),
                                    height: 100,
                                    width: 100,
                                    alignment: Alignment.bottomCenter,
                                    imageUrl: "assets/images/doctor.png" ?? "",
                                  )),
                              CircleAvatar(
                                backgroundColor: CustomColor.primaryPurple,
                                radius: 20,
                                child: Icon(Icons.camera_alt, color: CustomColor.white),
                              ),
                            ],
                          ),
                        ),
                        TextFieldWithLable(tr(context).name, tr(context).name, MediaQuery.of(context).size.width / 1.7, nameController)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                      child: TextFieldWithLable(tr(context).email, tr(context).email_hint, MediaQuery.of(context).size.width, emailController),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                      child: TextFieldWithLable(
                          tr(context).consulting_price, tr(context).consulting_price_hint, MediaQuery.of(context).size.width, consultantPriceController),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFieldWithLable("Phone Number", "Enter your number", MediaQuery.of(context).size.width / 2.3, phoneNumberController),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                tr(context).dob,
                                style: commonTextStyle(context, 14, FontWeight.normal, CustomColor.txtGray),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.3,
                              child: TextFormField(
                                enableInteractiveSelection: false,
                                controller: dobController,
                                showCursor: false,
                                scrollPadding: EdgeInsets.only(bottom: 130),
                                decoration: textFieldDecorationForProfile(tr(context).dob_hint, context),
                                validator: (value) {
                                  if (dobController.text.isEmpty) {
                                    return tr(context).date_select_error;
                                  } else {
                                    return null;
                                  }
                                },
                                onTap: () async {
                                  final DateTime? selectedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now().copyWith(year: DateTime.now().year - 18));

                                  if (selectedDate != null) {
                                    final DateFormat formatter = DateFormat('dd/MM/yyyy');
                                    final String formattedDate = formatter.format(selectedDate);

                                    dobController.text = formattedDate.toString();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    tr(context).gender,
                                    style: commonTextStyle(context, 14, FontWeight.normal, CustomColor.txtGray),
                                  ),
                                ),
                                DropdownButtonFormField<String>(
                                    items: gender.map((String stateName) {
                                      return DropdownMenuItem<String>(
                                        value: stateName,
                                        child: Text(stateName),
                                      );
                                    }).toList(),
                                    onChanged: (String? gender) {
                                      if (gender != null) {
                                        genderController.text = gender;
                                      }
                                    },
                                    decoration: textFieldDecorationForProfile(tr(context).gender, context)),
                              ],
                            ),
                          ),
                          TextFieldWithLable("Languages", "Select Languages", MediaQuery.of(context).size.width / 2.3, languageController),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        children: [
                          Text(
                            "Address",
                            style: commonTextStyle(context, 14, FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 1.35,
                              child: Divider(
                                color: CustomColor.borderPurple,
                                thickness: 0.5,
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextFieldWithLable("Country", "Enter your country", MediaQuery.of(context).size.width, countryController),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                tr(context).state,
                                style: commonTextStyle(context, 14, FontWeight.normal, CustomColor.txtGray),
                              ),
                            ),
                            DropdownButtonFormField<String>(
                                items: state.map((String stateName) {
                                  return DropdownMenuItem<String>(
                                    value: stateName,
                                    child: Text(stateName),
                                  );
                                }).toList(),
                                onChanged: (String? selectedState) {
                                  if (selectedState != null) {
                                    stateController.text = selectedState;
                                  }
                                },
                                decoration: textFieldDecorationForProfile(tr(context).selecCity, context)),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 150),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              tr(context).city,
                              style: commonTextStyle(context, 14, FontWeight.normal, CustomColor.txtGray),
                            ),
                          ),
                          DropdownButtonFormField<String>(
                              items: city.map((String stateName) {
                                return DropdownMenuItem<String>(
                                  value: stateName,
                                  child: Text(stateName),
                                );
                              }).toList(),
                              onChanged: (String? selectedState) {
                                if (selectedState != null) {
                                  cityController.text = selectedState;
                                }
                              },
                              decoration: textFieldDecorationForProfile(tr(context).selecCity, context)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              child: Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: CommonBottomAlignWidget(
                    setBottomWidget: CustomButton(CustomColor.white, CustomColor.primaryPurple, tr(context).continu, () async {
                      if (formKey.currentState?.validate() ?? false) {
                        ref.read(profileControllerProvider).addConsultant(nameController.text, emailController.text, dobController.text, genderController.text,
                            stateController.text, cityController.text, phoneNumberController.text, consultantPriceController.text, context);
                      }
                    }, 10, 1, MediaQuery.of(context).size.width),
                  ))),
        ],
      ),
    );
  }
}
