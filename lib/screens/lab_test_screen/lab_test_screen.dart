
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../consatant/ColorConstant.dart';
import '../../shared/common_search_bar.dart';
import '../../shared/shared_small_widgets.dart';



class LabTest extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarH("Lab Test",context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 15.0, bottom: 10),
            child: CommonSearchBar(title: "Search for Tests & package"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 15,right: 15),
            child: Container(padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      colors: [Color(0xff2F4B9A), Color(0xff516FBE)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Comprehensive Full\nBody Checkup",
                            style: TextStyle(
                                fontFamily: "interbold",
                                color: Colors.white,
                                fontSize: 18),overflow: TextOverflow.ellipsis,maxLines: 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                              "Lorem Ipsum is simply dummy\ntext of the printing",
                              style: TextStyle(fontSize: 13,color: Color(0xffBCD1FF)),overflow: TextOverflow.ellipsis,maxLines: 3),
                        ),
                       Row(
                         children: [
                           Text("\$699",style: TextStyle(fontFamily: "productsunbold",fontSize: 25,color: Colors.white),),
                           SizedBox(width: 10,),
                           Text("\$899.11",style: TextStyle(fontSize: 18,color: Color(0x30FFFFFF),decoration: TextDecoration.lineThrough),)
                         ],
                       )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CommonRating(padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      color: CustomColor.ratingRed,flag: false),
                      Image.asset("assets/images/medicalkkit.png"),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
