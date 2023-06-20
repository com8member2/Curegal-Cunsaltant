import 'package:consultation_curegal/consatant/ColorConstant.dart';
import 'package:consultation_curegal/routing/app_routes.dart';
import 'package:consultation_curegal/screens/account/repository/account_repository.dart';
import 'package:consultation_curegal/shared/controller/user_profile.dart';
import 'package:consultation_curegal/shared/widget/shared_small_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../shared/widget/account_setting_card_child_widget.dart';
import '../../../utility/utility.dart';

class AccountSettingsScreen extends HookConsumerWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        appBar: customAppBarH("Account", context, isShawBack: false),
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
                      context: context, image: Icons.account_circle_rounded, title: tr(context).acct_profile, description: tr(context).acct_profile_detail),
                ),
                CardListViewDesign(
                  edgeInsets: EdgeInsets.only(top: 20, bottom: 4),
                  onClick: () {
                    if (ref.read(userProfileProvider.select((value) => value.consultantPersonType == null))) {
                      Navigator.pushNamed(context, AppRoutes.consultationTypeScreen);
                    }
                  },
                  customWidget: commonCardChildView(
                    context: context,
                    image: Icons.category_outlined,
                    title: tr(context).acct_consultation_type,
                    description: tr(context).acct_consultation_detail,
                    icon: (ref.watch(userProfileProvider.select((value) => value.consultantPersonType != null))) ? null : Icons.navigate_next_outlined,
                    disabled: (ref.watch(userProfileProvider.select((value) => value.consultantPersonType != null))),
                  ),
                ),
                CardListViewDesign(
                  edgeInsets: EdgeInsets.only(top: 20, bottom: 4),
                  onClick: () {
                    var id = ref.read(userProfileProvider.select((value) => value.consultantPersonType));
                    if (id != null)
                      Navigator.pushNamed(context, AppRoutes.documentsVerifyScreen, arguments: id);
                  },
                  customWidget: commonCardChildView(
                    context: context,
                    image: Icons.featured_play_list,
                    title: tr(context).acct_documents,
                    description: tr(context).acct_documents_detail,
                    icon: (ref.watch(userProfileProvider.select((value) => value.consultantPersonType == null))) ? null : Icons.navigate_next_outlined,
                    disabled
                    :(ref.watch(userProfileProvider.select((value) => value.consultantPersonType == null))),),
                ),
                CardListViewDesign(
                  edgeInsets: EdgeInsets.only(top: 20, bottom: 4),
                  onClick: () {
                    if (ref.read(userProfileProvider.select((value) => value.consultantPersonType != null)))
                      Navigator.pushNamed(context, AppRoutes.educationnExperienceScreen);
                  },
                  customWidget: commonCardChildView(
                    context: context,
                    image: Icons.history_edu_rounded,
                    title: tr(context).acct_education,
                    description: tr(context).acct_education_details,
                    icon: (ref.watch(userProfileProvider.select((value) => value.consultantPersonType == null))) ? null : Icons.navigate_next_outlined,
                    disabled
                        :(ref.watch(userProfileProvider.select((value) => value.consultantPersonType == null))),),
                ),
                CardListViewDesign(
                  edgeInsets: EdgeInsets.only(top: 20, bottom: 4),
                  onClick: () {
                    Navigator.pushNamed(context, AppRoutes.languageSelectScreen);
                  },
                  customWidget: commonCardChildView(
                      context: context, image: Icons.language_outlined, title: tr(context).acct_languages, description: tr(context).acct_languages_details),
                ),
              ],
            ),
          ),
        ), //Center
      ),
    );
  }
}
