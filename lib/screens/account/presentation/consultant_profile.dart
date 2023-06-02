import 'package:consultation_curegal/consatant/ColorConstant.dart';
import 'package:consultation_curegal/shared/controller/user_profile.dart';
import 'package:consultation_curegal/shared/widget/custom_button.dart';
import 'package:consultation_curegal/shared/widget/custom_image_view.dart';
import 'package:consultation_curegal/shared/widget/shared_small_widgets.dart';
import 'package:consultation_curegal/utility/utility.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../shared/widget/textfield_decoration.dart';
import '../../authentication/Controller/auth_controller.dart';
import '../controller/consultant_profile_controller.dart';
import '../controller/document_controller.dart';

class ConsultationProfile extends HookConsumerWidget {
  Widget build(BuildContext context, WidgetRef ref) {
    var profile = ref.watch(getConsultantProfileProvider);

    return profile.when(
        data: (data) => view(context, ref, data),
        error: (error, stackTrace) => SizedBox(
              child: Center(child: Text("error")),
            ),
        loading: () => Center(child: SizedBox(height: 50, width: 50, child: CircularProgressIndicator())));
  }

  Scaffold view(BuildContext context, WidgetRef ref, [List<dynamic>? consultantProfiledata]) {
    final formKey = useMemoized(() => GlobalKey<FormState>(), []);
    final cityItems = useState<List<String>>([]);
    final stateItems = useState<List<String>>([]);


    useEffect(() {
      loadCSV('assets/csv/IndiaStates.csv').then((state) {
        state.add(tr(context).selecState);
        stateItems.value = state;
        print("all state ${stateItems.value}");
      });


      loadCSV('assets/csv/IndiaCities.csv').then((city) {
        city.add(tr(context).selecCity);
        cityItems.value = city;
        print("all city ${cityItems.value}");
      },);
      return null;
    }, []);



    final List<String> gender = ["Male", "Female", "Other",tr(context).gender];

    var nameController = useTextEditingController(text: consultantProfiledata?[0]['name']);
    var emailController = useTextEditingController(text: consultantProfiledata?[0]['email']);
    var phoneNumberController = useTextEditingController(text: ref.read(authControllerProvider).phoneNumber);
    var dobController = useTextEditingController(text: consultantProfiledata?[0]['date_of_birth']);
    var genderController = useTextEditingController(text: consultantProfiledata?[0]['gender']);
    var countryController = useTextEditingController(text: "India");
    var addressController = useTextEditingController(text: consultantProfiledata?[0]['address']);
    var stateController = useTextEditingController(text: consultantProfiledata?[0]['state']);
    var cityController = useTextEditingController(text: consultantProfiledata?[0]['city']);
    var consultantPriceController = useTextEditingController(text: consultantProfiledata?[0]['consulting_price']);

    return Scaffold(
      backgroundColor: CustomColor.white,
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20, bottom: 20),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width / 4,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  side: BorderSide(width: 2, color: Colors.transparent),
                  backgroundColor: CustomColor.primaryPurple,
                  foregroundColor: CustomColor.white,
                  padding: const EdgeInsets.all(10.0),
                ),
                onPressed: () {

                  if (formKey.currentState!.validate()){
                    ref.read(userProfileProvider.notifier).update({
                      'name': nameController.text,
                      'email': emailController.text,
                      'date_of_birth': dobController.text,
                      'gender': genderController.text,
                      'state': stateController.text,
                      'city': cityController.text,
                      'phone': phoneNumberController.text,
                      'address' : addressController.text,
                      'consulting_price': consultantPriceController.text,
                    });
                  }


                },
                child: Text(
                  tr(context).save,
                  style: const TextStyle(fontFamily: "productsun", fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
          )
        ],
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height / 10,
        backgroundColor: CustomColor.white,
        titleTextStyle: TextStyle(color: CustomColor.black, fontSize: 20, fontWeight: FontWeight.bold),
        leading: GestureDetector(onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back_ios, color: CustomColor.black)),
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
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: false,
                              context: context,
                              builder: (BuildContext context) => Container(
                                height: 200,
                                padding: const EdgeInsets.only(left: 30.0, top: 40.0, right: 30.0, bottom: 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 20.0),
                                      child: CustomButton(CustomColor.white, CustomColor.primaryPurple, tr(context).open_file_manager, () {
                                        Navigator.of(context).pop();
                                        ref.read(documentControllerProvider.notifier).getImageFromGallery();
                                      }, 10, 1, MediaQuery.of(context).size.width),
                                    ),
                                    CustomButton(CustomColor.white, CustomColor.primaryPurple, tr(context).open_camera, () async {
                                      Navigator.of(context).pop();
                                      await ref.read(documentControllerProvider.notifier).getImageFromCamera();
                                    }, 10, 1, MediaQuery.of(context).size.width)
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(500.0),
                                  child: CustomImageView(
                                    useCache: false,
                                      height: 100,
                                      width: 100,
                                      alignment: Alignment.bottomCenter,
                                      imagePath:  "assets/images/image_not_found.jpg",
                                      file: ref.watch(documentControllerProvider),
                                      url: consultantProfiledata?[0]['profile'])),
                              CircleAvatar(
                                backgroundColor: CustomColor.primaryPurple,
                                radius: 20,
                                child: Icon(Icons.camera_alt, color: CustomColor.white),
                              ),
                            ],
                          ),
                        ),
                        TextFieldWithLable(
                          tr(context).name,
                          consultantProfiledata!.isEmpty || consultantProfiledata?[0]['name'] == null ? tr(context).username_hint : nameController.text,
                          MediaQuery.of(context).size.width / 1.7,
                          nameController,
                          (value) {
                            if (nameController.text.isEmpty) {
                              return tr(context).username_error;
                            }
                          },
                        )
                      ],
                    ),
                     Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                      child: TextFieldWithLable(
                          tr(context).email,
                          consultantProfiledata.isEmpty || consultantProfiledata?[0]['email'] == null ? tr(context).email_hint : emailController.text,
                          MediaQuery.of(context).size.width,
                          emailController,
                              (value) {
                            if (emailController.text.isEmpty || !emailController.text.contains('@') || !emailController.text.contains('.')) {
                          return tr(context).email_error;
                        }
                      }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFieldWithLable(
                            tr(context).phone_number,
                            phoneNumberController.text,
                            MediaQuery.of(context).size.width / 2.3,
                            phoneNumberController, (value) {
                          if (phoneNumberController.text.isEmpty) {
                            return tr(context).phone_number_error;
                          }
                        }, TextInputType.number,false),
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
                                decoration: textFieldDecorationForProfile(
                                    consultantProfiledata!.isEmpty || consultantProfiledata?[0]['date_of_birth'] == null
                                        ? tr(context).dob_hint
                                        : dobController.text,
                                    context),
                                validator: (value) {
                                  if (dobController.text.isEmpty) {
                                    return tr(context).date_select_error;
                                  } else {
                                    return null;
                                  }
                                },
                                onTap: () async {
                                  final DateTime? selectedDate = await showDatePicker(
                                      context: context, initialDate: DateTime.now().copyWith(year: DateTime.now().year - 18), firstDate: DateTime(1900), lastDate: DateTime.now().copyWith(year: DateTime.now().year - 18));

                                  if (selectedDate != null) {
                                    final DateFormat formatter = DateFormat('yyyy-MM-dd');
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
                                  items: gender.map((String genderName) {
                                    return DropdownMenuItem<String>(
                                      value: genderName,
                                      child: Text(genderName),
                                    );
                                  }).toList(),
                                  value: tr(context).gender,
                                  onChanged: (String? gender) {
                                    if (gender != null) {
                                      genderController.text = gender;
                                    }
                                  },
                                  decoration: textFieldDecorationForProfile(
                                      consultantProfiledata!.isEmpty || consultantProfiledata[0]['gender'] == ''
                                          ? tr(context).gender
                                          : genderController.text,
                                      context),
                                  validator: (value) {
                                    if (genderController.text.isEmpty || value == tr(context).gender) {
                                      return tr(context).gender_error;
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          TextFieldWithLable(
                              tr(context).consulting_price,
                              consultantProfiledata!.isEmpty || consultantProfiledata?[0]['consulting_price'] == ''
                                  ? tr(context).consulting_price_hint
                                  : consultantPriceController.text,
                              MediaQuery.of(context).size.width / 2.3,
                              consultantPriceController, (value) {
                            if (consultantPriceController.text.isEmpty) {
                              return tr(context).consulting_price_error;
                            }
                          }, TextInputType.number),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        children: [
                          Text(
                            tr(context).address,
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
                      child: TextFieldWithLable(tr(context).address,
                          consultantProfiledata!.isEmpty || consultantProfiledata?[0]['address'] == null ? tr(context).enter_address : addressController.text,

                           MediaQuery.of(context).size.width, addressController,
                              (value) {
                            if (addressController.text.isEmpty) {
                              return tr(context).address_error;
                            }
                          },TextInputType.text),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextFieldWithLable(tr(context).country, countryController.text, MediaQuery.of(context).size.width, countryController,
                          (value) {
                        if (countryController.text.isEmpty) {
                          return tr(context).country_error;
                        }
                      },TextInputType.text,false),
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
                              items: stateItems.value.map((String stateName) {
                                return DropdownMenuItem<String>(
                                  value: stateName,
                                  child: Text(stateName),
                                );
                              }).toList(),
                              value: stateController.text.isEmpty ? tr(context).selecState : stateController.text,
                              onChanged: (String? selectedState) {
                                if (selectedState != null) {
                                  stateController.text = selectedState;
                                }
                              },
                              decoration: textFieldDecorationForProfile(
                                  consultantProfiledata.isEmpty || consultantProfiledata?[0]['state'] == ''
                                      ? tr(context).selecState
                                      : stateController.text,
                                  context),
                              validator: (value) {
                                if (stateController.text.isEmpty || value==tr(context).selecState) {
                                  return tr(context).state_error;
                                }
                              },
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
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
                            items: cityItems.value.map((String cityName) {
                              return DropdownMenuItem<String>(
                                value: cityName,
                                child: Text(cityName),
                              );
                            }).toList(),
                            value: cityController.text.isEmpty ? tr(context).selecCity : cityController.text,
                            onChanged: (String? selectedCity) {
                              if (selectedCity != null) {
                                cityController.text = selectedCity;
                              }
                            },
                            decoration: textFieldDecorationForProfile(
                                consultantProfiledata!.isEmpty || consultantProfiledata?[0]['city'] == ''
                                    ? tr(context).selecCity
                                    : cityController.text,
                                context),
                            validator: (value) {
                              if (cityController.text.isEmpty||value == tr(context).selecCity) {
                                return tr(context).city_error;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<List<String>> loadCSV(String fileName) async {
    final String csvData = await rootBundle.loadString(fileName);
    final  List<dynamic> rowsAsListOfValues = const CsvToListConverter(eol: '\n').convert(csvData);

    final cities = rowsAsListOfValues
        .map((row) => row[1].toString())
        .toList();

    if (cities.isNotEmpty && cities[0].toLowerCase() == 'name') {
      cities.removeAt(0);
    }
   return cities;
  }
}



