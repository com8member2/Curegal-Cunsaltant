
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../consatant/ColorConstant.dart';
import '../../../shared/common_search_bar.dart';
import '../../../shared/shared_small_widgets.dart';
import '../../../utility/utility.dart';
import '../widget/doctor_detail_card.dart';


class ConsultationDoctorsList extends HookWidget {
  const ConsultationDoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarH("Body Transformation", context,CustomColor.white,Colors.black,true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
            child: Container(
            child: CommonSearchBar(title: "Search doctors",size: 17.0,)
          )),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return DoctorDetailCard();
              },
            ),
          )
        ],
      ),
    );
  }
}
