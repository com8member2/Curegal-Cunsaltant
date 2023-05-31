import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../consatant/ColorConstant.dart';
import '../../../shared/widget/common_bottom_align.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/shared_small_widgets.dart';
import '../../../utility/utility.dart';
import '../Controller/auth_controller.dart';

class LoginScreen extends HookConsumerWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context,ref) {
    var mobileMaxLength = useState(10);
    var countryCode = useState("91");
    TextEditingController phoneController = useTextEditingController();

    return Scaffold(
      appBar: customAppBarH(tr(context).login, context, CustomColor.primaryPurple, Colors.white, false),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: screenHeadingSubtitle(
                      tr(context).login_heading,
                      tr(context).mobile_hint,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 40, bottom: 20),
                    child: TextFormField(
                      controller: phoneController,
                      autofocus: true,
                      key: Key("mobileNumber"),
                      scrollPadding: EdgeInsets.only(bottom: 130),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'\d')),
                      ],
                      maxLength: mobileMaxLength.value,
                      keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
                      style: const TextStyle(
                        color: CustomColor.black,
                        fontSize: 17,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Phone Number';
                        }else if (value.length != mobileMaxLength.value){
                          return "Please enter valid Phone Number";
                        }
                      },
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          icon: GestureDetector(
                            onTap: () {
                              showCountryPicker(
                                countryListTheme: CountryListThemeData(
                                  borderRadius: BorderRadius.zero,
                                  textStyle: TextStyle(fontFamily: "uber"),
                                  backgroundColor: CustomColor.white,
                                  inputDecoration: InputDecoration(
                                    suffixIcon: Icon(Icons.search),
                                    fillColor: CustomColor.gray,
                                    filled: true,
                                    hintText: tr(context).search,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                ),
                                context: context,
                                showPhoneCode: true,
                                onSelect: (Country country) {
                                  ref.read(authControllerProvider).country = country.name;
                                  print(country.name);
                                  countryCode.value = country.phoneCode;
                                  mobileMaxLength.value = country.example.length;
                                },
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 80,
                              height: 55,
                              decoration: BoxDecoration(
                                color: CustomColor.gray,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ValueListenableBuilder(
                                    valueListenable: countryCode,
                                    builder: (context, value, child) => Text("+${countryCode.value}"),
                                  ),
                                  const Icon(
                                    Icons.arrow_drop_down_sharp,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                            ),
                          ),
                          labelStyle: const TextStyle(fontSize: 15),
                          hintStyle: const TextStyle(fontSize: 15),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(0),
                          ),
                          hintText: tr(context).mobile,
                          filled: true,
                          counterText: "",
                          fillColor: CustomColor.gray),
                    ),
                  ),
                  // referralCodeWidget(context),
                  const SizedBox(
                    height: 130,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              child: Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: CommonBottomAlignWidget(
                    setBottomWidget: CustomButton(CustomColor.white, CustomColor.primaryPurple, tr(context).continu, () async {
                      if (_formKey.currentState?.validate()??false) {
                        ref.read(authControllerProvider).checkUser(countryCode.value, phoneController.text, context);
                      }
                    }, 10, 1, MediaQuery.of(context).size.width),
                  ))),
        ],
      ),
    );
  }

}
