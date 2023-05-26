
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../consatant/ColorConstant.dart';
import '../../../shared/custom_button.dart';
import '../../../utility/utility.dart';


class ChatWithConsultant extends HookWidget {
  const ChatWithConsultant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: MediaQuery.of(context).size.width,child:
      Column(children: [
        Text("Your consultation with Dr. Lane Holden has ended", style: TextStyle(color: Colors.red,fontSize: 14),),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20),
          child: CustomButton(CustomColor.white,CustomColor.primaryPurple,"Book Another Consultation",() {
          },10,1,MediaQuery.of(context).size.width),
        )
      ]),);
  }
}
