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