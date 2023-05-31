import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../consatant/ColorConstant.dart';
import '../../../shared/widget/common_bottom_align.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/shared_small_widgets.dart';
import '../../../consatant/Constants.dart';
import '../../../routing/app_routes.dart';

import '../../../shared/widget/common_bottom_align.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/shared_small_widgets.dart';
import '../../../utility/utility.dart';
import '../Controller/auth_controller.dart';
import 'Widget/Resendotp.dart';

class SendOTP extends HookConsumerWidget {
  const SendOTP({super.key});

  @override
  Widget build(BuildContext context, ref) {
    Map args = ModalRoute.of(context)?.settings.arguments as Map;

    final String phoneNumber = args['phoneNumber'];

    final formKey = useMemoized(() => GlobalKey<FormState>(), []);
    var otp = useState("");
    var otpValue = useState('');
    TextEditingController otpController = TextEditingController();
    return Scaffold(
      appBar: customAppBarH(tr(context).otp, context, CustomColor.primaryPurple, Colors.white, true),
      body: Form(
        key: formKey,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 50, left: 15, right: 15),
                      child: Text(
                        tr(context).enter_otp,
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      )),
                  Container(
                      padding: const EdgeInsets.only(top: 10, left: 15),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        tr(context).enter_otp_mobile_for_login,
                        style: const TextStyle(fontSize: 17, color: CustomColor.txtGray),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 15, top: 50),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: PinCodeTextField(
                        controller: otpController,
                        autoFocus: false,
                        scrollPadding: EdgeInsets.only(bottom: 130),
                        keyboardType: TextInputType.number,
                        cursorColor: CustomColor.black,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'\d')),
                        ],
                        length: 6,
                        obscureText: false,
                        animationType: AnimationType.scale,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderWidth: 1,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 55,
                          fieldWidth: 50,
                          activeColor: CustomColor.txtGray,
                          inactiveColor: CustomColor.darkGray,
                          selectedColor: CustomColor.black,
                          errorBorderColor: CustomColor.ratingRed,
                          activeFillColor: Colors.transparent,
                          inactiveFillColor: Colors.transparent,
                          selectedFillColor: Colors.transparent,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        onSubmitted: (value) async {
                          ref.read(authControllerProvider).submit(otpValue.value, phoneNumber, context);
                        },
                        onChanged: (value) {
                          otpValue.value = value;
                        },
                        appContext: context,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15, top: 20),
                    child: ResendOTPTimerWidget(phoneNumber: phoneNumber),
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CommonBottomAlignWidget(
                  setBottomWidget: CustomButton(CustomColor.white, CustomColor.primaryPurple, tr(context).submit, () async {
                if (formKey.currentState?.validate() ?? false) {
                  ref.read(authControllerProvider).submit(otpValue.value, phoneNumber, context);
                } else {
                  EasyLoading.showInfo("Please check otp or resend otp");
                }
              }, 10, 1, MediaQuery.of(context).size.width)),
            ),
          ],
        ),
      ),
    );
  }
}
