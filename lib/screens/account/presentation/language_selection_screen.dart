import 'package:consultation_curegal/consatant/ColorConstant.dart';
import 'package:consultation_curegal/shared/shared_small_widgets.dart';
import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../shared/common_bottom_align.dart';
import '../../../shared/custom_button.dart';

class LanguageSelect extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final selectedCardIndex = useState(1);

    Widget buildCard(int index, String text) {
      return Card(
        color: selectedCardIndex.value == index ? CustomColor.primaryPurple : null,
        child: ListTile(
          title: Text(
            text,
            style: selectedCardIndex.value == index ?commonTextStyle(context, 16,FontWeight.normal,CustomColor.white) : commonTextStyle(context, 16,FontWeight.normal,CustomColor.black),
          ),
          trailing: selectedCardIndex.value == index ? Icon(Icons.check,color: CustomColor.white,) : null,
          onTap: () {
            selectedCardIndex.value = index;
          },
        ),
      );
    }

    return Scaffold(
      appBar: customAppBarH(tr(context).acct_languages, context,CustomColor.primaryPurple,CustomColor.white),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  screenHeadingSubtitle(tr(context).choose_your_language, tr(context).sub_heading_language_screen),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: buildCard(0, 'English'),
                  ),
                  buildCard(1, 'Hindi'),
                  buildCard(2, 'Urdu'),
                ],
              ),
            )
          ),
          Positioned(
              child: Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: CommonBottomAlignWidget(
                    setBottomWidget: CustomButton(CustomColor.white, CustomColor.primaryPurple, tr(context).continu, ()  {

                    }, 10, 1, MediaQuery.of(context).size.width),
                  ))),
        ],
      ),
    );
  }
}



