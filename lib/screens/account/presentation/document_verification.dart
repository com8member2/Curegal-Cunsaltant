import 'dart:io';
import 'package:consultation_curegal/consatant/ColorConstant.dart';

import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../consatant/Constants.dart';
import '../../../routing/app_routes.dart';
import '../../../shared/widget/account_setting_card_child_widget.dart';
import '../../../shared/widget/common_bottom_align.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/shared_small_widgets.dart';


class DocumentsVerificationScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        appBar: customAppBarH(tr(context).document_verify, context, CustomColor.primaryPurple, CustomColor.white),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr(context).document_heading,
                      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        tr(context).remaining_steps,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        tr(context).remaining_desc,
                        style: const TextStyle(fontSize: 18, color: CustomColor.txtGray),
                      ),
                    ),
                    CardListViewDesign(
                      onClick: () {
                          Navigator.pushNamed(context, AppRoutes.documentUploadScreen,arguments: {"documentName" : tr(context).aadhaar_card});
                      },
                      customWidget: commonCardChildView(
                          context: context, image: Icons.featured_play_list, title: tr(context).aadhaar_card, description: tr(context).aadhaar_card),
                    ),
                    const SizedBox(height: 10),
                    CardListViewDesign(
                      onClick: () {
                        Navigator.pushNamed(context, AppRoutes.documentUploadScreen,arguments: {"documentName" :  tr(context).pan_card});

                      },
                      customWidget: commonCardChildView(
                          context: context,
                          image: Icons.featured_play_list,
                          title: tr(context).pan_card,
                          description: tr(context).pan_card),
                    ),
                    const SizedBox(height: 10),
                    CardListViewDesign(
                      onClick: () {
                        Navigator.pushNamed(context, AppRoutes.documentUploadScreen,arguments: {"documentName" :  tr(context).doctor_certificate});

                      },
                      customWidget: commonCardChildView(
                          context: context,
                          image: Icons.featured_play_list,
                          title: tr(context).doctor_certificate,
                          description: tr(context).doctor_certificate),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                child: Container(
                    padding: const EdgeInsets.only(top: 40),
                    child: CommonBottomAlignWidget(
                      setBottomWidget: CustomButton(
                          CustomColor.white, CustomColor.primaryPurple, tr(context).continu, () {}, 10, 1, MediaQuery.of(context).size.width),
                    ))),
          ],
        ), //Center
      ),
    );
  }

  Future<PostgrestResponse<dynamic>> getDocumentList() async {
    PostgrestResponse<dynamic> res = await Constants.supabaseClient
        .from('consultant_profile')
        .select()
        .eq("consultant_person_type", 3)
        .execute();
    return res;
  }
}
