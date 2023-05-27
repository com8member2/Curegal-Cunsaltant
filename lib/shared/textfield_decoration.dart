import 'package:flutter/material.dart';

import '../consatant/ColorConstant.dart';

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
  return InputDecoration(
    filled: true,
    hintText: hint,
    counterText: "",
    fillColor: CustomColor.blue,
    hintStyle: TextStyle(color: CustomColor.txtGray),
    border:const OutlineInputBorder(
        borderSide: BorderSide(color: CustomColor.borderPurple), borderRadius: BorderRadius.all(Radius.circular(10))) ,
    disabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: CustomColor.borderPurple), borderRadius: BorderRadius.all(Radius.circular(10))),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: CustomColor.borderPurple), borderRadius: BorderRadius.all(Radius.circular(10))),
  );
}