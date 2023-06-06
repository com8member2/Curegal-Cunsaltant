import 'dart:developer';

import 'package:consultation_curegal/consatant/ColorConstant.dart';
import 'package:consultation_curegal/routing/app_routes.dart';
import 'package:consultation_curegal/screens/account/controller/language_controller.dart';
import 'package:consultation_curegal/screens/account/repository/account_repository.dart';
import 'package:consultation_curegal/shared/widget/shared_small_widgets.dart';
import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../consatant/Constants.dart';
import '../../../shared/controller/user_profile.dart';
import '../../../shared/widget/common_bottom_align.dart';
import '../../../shared/widget/custom_button.dart';

class LanguageSelect extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var languages = ref.watch(languagesProvider);

    return Scaffold(
      appBar: customAppBarH(tr(context).acct_languages, context, backgroundColor: CustomColor.primaryPurple,textColor:  CustomColor.white),
      body: Stack(
        children: [
          languages.when(
            data: (data) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    screenHeadingSubtitle(tr(context).choose_your_language, tr(context).sub_heading_language_screen),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 120),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return _ItemWidget(index);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            error: (error, stackTrace) => Text('Error: ${error}'),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
          Positioned(
              child: Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: CommonBottomAlignWidget(
                    setBottomWidget: CustomButton(CustomColor.white, CustomColor.primaryPurple, tr(context).continu, () async {
                      await ref.read(languagesProvider.notifier).selectLanguages(ref, context);
                    }, 10, 1, MediaQuery.of(context).size.width),
                  ))),
        ],
      ),
    );
  }
}

class _ItemWidget extends HookConsumerWidget {
  final int index;

  const _ItemWidget(
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(languagesProvider.select((value) => value.value?.elementAt(index)));
    var isChecked = data["isSelected"] ?? false;
    return Card(margin: EdgeInsets.symmetric(vertical: 8),elevation: 5,
      color: isChecked ? CustomColor.primaryPurple : null,
      child: ListTile(
        title: Text(
          data['name'],
          style: commonTextStyle(context, 16, FontWeight.normal, isChecked ? CustomColor.white : CustomColor.black),
        ),
        trailing: Checkbox(
          activeColor: CustomColor.primaryPurple,
          checkColor: CustomColor.white,
          value: isChecked,
          onChanged: (value) {
            isChecked = !isChecked;
            ref.read(languagesProvider.notifier).toggleCheckbox(data, index);
          },
        ),
        onTap: () {
          ref.read(languagesProvider.notifier).toggleCheckbox(data, index);
        },
      ),
    );
  }
}
