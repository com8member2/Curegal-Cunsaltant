import 'package:consultation_curegal/consatant/ColorConstant.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../screens/account/controller/consultation_category_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// ignore: must_be_immutable
class CustomChipWidget extends HookConsumerWidget {
  String text;
  bool isSelected;
  Function onClick;

  CustomChipWidget(this.text, this.isSelected, this.onClick);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent,
        splashColor: CustomColor.primaryPurple,
      ),
      child: Padding(
          padding: EdgeInsets.only(right: 10, top: 5),
          child: ChoiceChip(
            disabledColor: Colors.transparent,
            pressElevation: 0,
            padding: EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
            labelPadding: EdgeInsets.zero,
            label: Text(
              text,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: !isSelected ? CustomColor.black : CustomColor.blue,
                fontSize: 16,
                fontFamily: 'Haskoy',
                fontWeight: FontWeight.w700,
              ),
            ),
            selected: isSelected,
            side: BorderSide(color: (isSelected) ? Colors.transparent : CustomColor.primaryPurple, width: 1, style: BorderStyle.solid),
            backgroundColor: CustomColor.secondPrimaryPurple,
            selectedColor: CustomColor.primaryPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                24,
              ),
            ),
            onSelected: (value) {
              onClick(value);
            },
          )),
    );
  }
}
