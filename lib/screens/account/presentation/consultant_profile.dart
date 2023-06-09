import 'dart:developer';

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
import '../controller/consultant_profile_controller.dart';
import '../controller/document_controller.dart';

class ConsultationProfile extends HookConsumerWidget {
  const ConsultationProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var profile = ref.watch(getConsultantProfileProvider);

    return profile.when(
        data: (data) => view(context, ref, data),
        error: (error, stackTrace) => const SizedBox(
              child: Center(child: Text("error")),
            ),
        loading: () => const Center(child: SizedBox(height: 50, width: 50, child: CircularProgressIndicator())));
  }

  Scaffold view(BuildContext context, WidgetRef ref, [List<dynamic>? consultantProfiledata]) {
    final formKey = useMemoized(() => GlobalKey<FormState>(), []);

    final cityItems = useState<List<String>>([]);
    final stateItems = useState<Map<String, dynamic>>({});
    // final city = useState<List<String>>([]);

    useEffect(() {
        loadState('assets/csv/IndiaStates.csv').then((state) {
          state.addAll({
            "name": {"id": 0, "name": tr(context).selecState}
          });
          stateItems.value = state;
        });

      return null;
    }, []);

    final List<String> gender = ["Male", "Female", "Other"];

    var nameController = useTextEditingController(text: consultantProfiledata?[0]['name']);
    var emailController = useTextEditingController(text: consultantProfiledata?[0]['email']);
    var phoneNumberController = useTextEditingController(text: consultantProfiledata?[0]['phone']);
    var dobController = useTextEditingController(text: consultantProfiledata?[0]['date_of_birth']);
    var genderController = useTextEditingController(text: consultantProfiledata?[0]['gender']);
    var countryController = useTextEditingController(text: "India");
    var addressController = useTextEditingController(text: consultantProfiledata?[0]['address']);
    var stateController = useTextEditingController(text: consultantProfiledata?[0]['state']);
    var cityController = useTextEditingController(text: consultantProfiledata?[0]['city']);


    return Scaffold(
      backgroundColor: CustomColor.white,
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20, bottom: 20),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width / 4,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  side: const BorderSide(width: 2, color: Colors.transparent),
                  backgroundColor: CustomColor.primaryPurple,
                  foregroundColor: CustomColor.white,
                  padding: const EdgeInsets.all(10.0),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ref.read(userProfileProvider.notifier).update({
                      'name': nameController.text,
                      'email': emailController.text,
                      'date_of_birth': dobController.text,
                      'gender': genderController.text,
                      'state': stateController.text,
                      'city': cityController.text,
                      'phone': phoneNumberController.text,
                      'address' : addressController.text,
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
        titleTextStyle: const TextStyle(color: CustomColor.black, fontSize: 20, fontWeight: FontWeight.bold),
        leading: GestureDetector(onTap: () => Navigator.pop(context), child: const Icon(Icons.arrow_back_ios, color: CustomColor.black)),
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
                                      imagePath: "assets/images/image_not_found.jpg",
                                      file: ref.watch(documentControllerProvider),
                                      url: consultantProfiledata?[0]['profile'])),
                              const CircleAvatar(
                                backgroundColor: CustomColor.primaryPurple,
                                radius: 20,
                                child: Icon(Icons.camera_alt, color: CustomColor.white),
                              ),
                            ],
                          ),
                        ),
                        TextFieldWithLable(
                          tr(context).name,
                          consultantProfiledata!.isEmpty || consultantProfiledata[0]['name'] == null ? tr(context).username_hint : nameController.text,
                          MediaQuery.of(context).size.width / 1.7,
                          nameController,
                          (value) {
                            if (nameController.text.isEmpty) {
                              return tr(context).username_error;
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                      child: TextFieldWithLable(
                          tr(context).email,
                          consultantProfiledata.isEmpty || consultantProfiledata[0]['email'] == null ? tr(context).email_hint : emailController.text,
                          MediaQuery.of(context).size.width,
                          emailController, (value) {
                        if (emailController.text.isEmpty || !emailController.text.contains('@') || !emailController.text.contains('.')) {
                          return tr(context).email_error;
                        }
                        return null;
                      }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFieldWithLable(
                            tr(context).phone_number,
                            consultantProfiledata.isEmpty || consultantProfiledata[0]['phone'] == null ? tr(context).enter_phone_number : phoneNumberController.text,
                            MediaQuery.of(context).size.width / 2.3,
                            phoneNumberController, (value) {
                          if (phoneNumberController.text.isEmpty) {
                            return tr(context).phone_number_error;
                          }
                          return null;
                        }, keyboardType: TextInputType.number, isEnable: false),
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
                                scrollPadding: const EdgeInsets.only(bottom: 130),
                                decoration: textFieldDecorationForProfile(
                                    consultantProfiledata.isEmpty || consultantProfiledata[0]['date_of_birth'] == null ? tr(context).dob_hint : dobController.text,
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
                                      context: context,
                                      initialDate: DateTime.now().copyWith(year: DateTime.now().year - 18),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now().copyWith(year: DateTime.now().year - 18));

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
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
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
                              value: genderController.text.isEmpty ? "Male" : genderController.text,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tr(context).address,
                            style: commonTextStyle(context, 14, FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width/1.4,
                              child: Divider(
                                color: CustomColor.borderPurple,
                                thickness: 0.5,
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextFieldWithLable(
                          tr(context).address,
                          consultantProfiledata.isEmpty || consultantProfiledata[0]['address'] == null ? tr(context).enter_address : addressController.text,
                          MediaQuery.of(context).size.width,
                          addressController, (value) {
                        if (addressController.text.isEmpty) {
                          return tr(context).address_error;
                        }
                        return null;
                      },keyboardType:  TextInputType.text),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextFieldWithLable(tr(context).country, countryController.text, MediaQuery.of(context).size.width, countryController, (value) {
                        if (countryController.text.isEmpty) {
                          return tr(context).country_error;
                        }
                        return null;
                      }, keyboardType: TextInputType.text,isEnable:  false),
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
                              items: stateItems.value.values.map((stateName) {
                                return DropdownMenuItem<String>(
                                  value: stateName['name'],
                                  child: Text(stateName['name']),
                                );
                              }).toList(),
                              value: stateController.text.isEmpty ? tr(context).selecState : stateController.text,
                              onChanged: (selectedState) async {
                                if (selectedState != null) {
                                  stateController.text = selectedState;
                                  String selectedId = stateItems.value.isNotEmpty ? stateItems.value[selectedState]['id'] : null;

                                  await loadCity('assets/csv/IndiaCities.csv').then((data) {
                                    var list = data.values.where((element) => element['id'] == selectedId).toList();
                                    cityItems.value.clear();
                                    cityItems.value = list.map((e) => e["name"].toString()).toList();
                                    // for(int i = 0; i<list.length; i++){
                                    //   cityItems.value.add(list[i]['name']);
                                    // }
                                    cityItems.value.insert(0, tr(context).selecCity);
                                    cityController.text = "";
                                    print('Selected ID: $selectedId & ${cityItems.value}');
                                  });
                                }
                              },
                              decoration: textFieldDecorationForProfile(
                                  consultantProfiledata.isEmpty || consultantProfiledata[0]['state'] == '' ? tr(context).selecState : stateController.text, context),
                              validator: (value) {
                                if (stateController.text.isEmpty || value == tr(context).selecState) {
                                  return tr(context).state_error;
                                }
                                return null;
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
                            items: cityItems.value.map((cityName) {
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
                                consultantProfiledata.isEmpty || consultantProfiledata[0]['city'] == '' ? tr(context).selecCity : cityController.text, context),
                            validator: (value) {
                              if (cityController.text.isEmpty || value == tr(context).selecCity) {
                                return tr(context).city_error;
                              }
                              return null;
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

  Future<Map<String, dynamic>> loadState(String fileName) async {
    final String csvData = await rootBundle.loadString(fileName);
    final List<dynamic> rowsAsListOfValues = const CsvToListConverter(eol: '\n').convert(csvData);

    Map<String, dynamic> stateMap = {};
    for (var row in rowsAsListOfValues) {
      String id = row[0].toString();
      String name = row[1].toString();
      stateMap[name] = {'id': id, 'name': name};
    }
    return stateMap;
  }

  Future<Map<String, dynamic>> loadCity(String fileName, [String stateID = '']) async {
    String stateCsvData = await rootBundle.loadString(fileName);
    List<List<dynamic>> cityList = const CsvToListConverter(eol: '\n').convert(stateCsvData);

    Map<String, dynamic> cityMap = {};
    for (var row in cityList) {
      String id = row[2].toString();
      String name = row[1].toString();
      cityMap[name] = {'id': id, 'name': name};
    }
    return cityMap;
  }
}
