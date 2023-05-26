import 'package:consultation_curegal/consatant/ColorConstant.dart';
import 'package:consultation_curegal/routing/app_routes.dart';
import 'package:consultation_curegal/shared/shared_small_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../shared/account_setting_card_child_widget.dart';
import '../../../utility/utility.dart';

class AccountSettingsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        appBar: customAppBarH("Account", context, CustomColor.primaryPurple, CustomColor.white),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardListViewDesign(
                  onClick: () {
                    Navigator.pushNamed(context, AppRoutes.consultationProfileScreen);
                  },
                  customWidget: commonCardChildView(
                      context: context,
                      image: Icons.info,
                      title: tr(context).acct_profile,
                      description:tr(context).acct_profile_detail),
                ),
                const SizedBox(height: 10),
                CardListViewDesign(
                  onClick: () {
                    Navigator.pushNamed(context, AppRoutes.consultationTypeScreen);
                  },
                  customWidget: commonCardChildView(
                      context: context,
                      image: Icons.category_outlined,
                      title: tr(context).acct_consultation_type,
                      description:
                      tr(context).acct_consultation_detail),
                ),
                const SizedBox(height: 10),
                CardListViewDesign(
                  onClick: () {
                    Navigator.pushNamed(context, AppRoutes.documentsVerifyScreen);
                  },
                  customWidget: commonCardChildView(
                      context: context,
                      image: Icons.featured_play_list,
                      title: tr(context).acct_documents,
                      description:
                      tr(context).acct_documents_detail),
                ),
                const SizedBox(height: 10),
                CardListViewDesign(
                  onClick: () {
                    Navigator.pushNamed(context, AppRoutes.educationnExperienceScreen);
                  },
                  customWidget: commonCardChildView(
                      context: context,
                      image: Icons.history_edu_rounded,
                      title:  tr(context).acct_education,
                      description:
                          tr(context).acct_education_details),
                ),
                const SizedBox(height: 10),
                CardListViewDesign(
                  onClick: () {
                    Navigator.pushNamed(context, AppRoutes.languageSelectScreen);
                  },
                  customWidget: commonCardChildView(
                      context: context,
                      image: Icons.language_outlined,
                      title: tr(context).acct_languages,
                      description: tr(context).acct_languages_details),
                ),
              ],
            ),
          ),
        ), //Center
      ),
    );
  }
}
