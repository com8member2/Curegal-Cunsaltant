import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../consatant/ColorConstant.dart';


class CustomTextField  extends StatelessWidget {
  final String hintText;
  final int? maxLine;
  final double width;
  final Color backgroundColor;
  final double borderRadius;
  final BorderSide borderSide;
  const CustomTextField(this.hintText,[this.backgroundColor=CustomColor.gray,this.borderRadius=15,this.borderSide=BorderSide.none,this.maxLine,this.width=0]);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: borderSide,
          borderRadius: BorderRadius.circular(borderRadius),

        ),
        filled: true,
        fillColor: backgroundColor,
      ),
    );
  }
}
