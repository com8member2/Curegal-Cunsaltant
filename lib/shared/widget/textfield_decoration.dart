import 'package:flutter/material.dart';

import '../../consatant/ColorConstant.dart';


InputDecoration textFieldDecoration(String hint,BuildContext context) {
  return InputDecoration(
    filled: true,
    hintText: hint,
    counterText: "",
    fillColor: CustomColor.gray,
    hintStyle: TextStyle(color: CustomColor.txtGray),
    border: const OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.zero),
  );
}

InputDecoration textFieldDecorationForProfile(String hint,BuildContext context) {
  const outlineInputBorder = const OutlineInputBorder(
        borderSide: BorderSide(color: CustomColor.darkPurple), borderRadius: BorderRadius.all(Radius.circular(10)));
  return InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 15),
    filled: true,
    hintText: hint,
    counterText: "",
    fillColor: CustomColor.mediumPurple.withOpacity(0.1),
    hintStyle: TextStyle(color: CustomColor.txtGray),
    border:outlineInputBorder ,
    disabledBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,

  );
}