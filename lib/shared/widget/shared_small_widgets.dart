import 'package:consultation_curegal/shared/widget/textfield_decoration.dart';
import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../consatant/ColorConstant.dart';


class DividerLightPink extends StatelessWidget {
  const DividerLightPink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 10,
      color: CustomColor.lightGry,
    );
  }
}
class CommonRating extends HookConsumerWidget {
  CommonRating({required this.padding, this.color = CustomColor.mediumGreen, this.flag = true});

  final EdgeInsetsGeometry padding;
  final Color color;
  final bool flag;

  @override
  Widget build(BuildContext context,ref) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          flag ? const Icon(Icons.star, color: Colors.white, size: 15) : const Text("75%", style: TextStyle(color: Colors.white, fontFamily: "intersemibold")),
          const SizedBox(
            width: 3,
          ),
          flag
              ? const Text(
            "92%",
            style: TextStyle(color: Colors.white),
          )
              : const Text(
            "OFF",
            style: TextStyle(fontFamily: "intersemibold", color: Colors.white),
          )
        ],
      ),
    );
  }
}
Widget screenHeadingSubtitle(String heading, String subtitle) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 50,
      ),
      Text(
        heading,
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: "productsun"),
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        subtitle,
        style: const TextStyle(
          fontFamily: "productsun",
          fontSize: 17,
          color: CustomColor.txtGray,
        ),
      ),
    ],
  );
}

PreferredSizeWidget customAppBarH(String heading, BuildContext context,
    [Color? backgroundColor = CustomColor.white, Color? textColor = CustomColor.black, bool isShawBack = true,List<Widget>? actions,double? toolbarHeight]) {
  return AppBar(
    title: Text(heading),
    actions: actions,
    elevation: 0,
    toolbarHeight: toolbarHeight,
    backgroundColor: backgroundColor,
    titleTextStyle: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
    leading: isShawBack ? GestureDetector(onTap: () => Navigator.pop(context), child: Icon(Icons.arrow_back_ios, color: textColor)) : null,
  );
}

class TextFieldWithLable extends StatelessWidget {

  final String text ;
  final String textfieldHinttext ;
  final double textfieldWidth;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;


  const TextFieldWithLable(this.text,this.textfieldHinttext,this.textfieldWidth,this.controller,this.validator,[this.keyboardType=TextInputType.text]);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
      Text(text,style: commonTextStyle(context, 14,FontWeight.normal,CustomColor.txtGray),),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SizedBox(
            width: textfieldWidth,
            child: TextFormField(
              controller: controller,
              decoration: textFieldDecorationForProfile(textfieldHinttext, context),
              validator: validator,
              keyboardType: keyboardType,

            )),
      )
    ],);
  }

}
