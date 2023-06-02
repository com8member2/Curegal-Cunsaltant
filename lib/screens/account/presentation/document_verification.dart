import 'dart:developer';

import 'package:consultation_curegal/consatant/ColorConstant.dart';
import 'package:consultation_curegal/consatant/Constants.dart';
import 'package:consultation_curegal/screens/account/controller/document_controller.dart';
import 'package:consultation_curegal/shared/widget/shared_small_widgets.dart';
import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../routing/app_routes.dart';
import '../../../shared/widget/account_setting_card_child_widget.dart';
import '../../../shared/widget/common_bottom_align.dart';
import '../../../shared/widget/custom_button.dart';

class DocumentsVerificationScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var personType = ModalRoute.of(context)?.settings.arguments as int;

    var documents = ref.watch(getDocumentsProvider(personType));
    return Scaffold(
      appBar: customAppBarH(tr(context).document_verify, context, CustomColor.primaryPurple, CustomColor.white),
      body: Stack(
        children: [
          Padding(
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
                documents.when(
                    data: (data) => ListView.builder(
                          itemCount: data.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            String status = DocumentStatus.pending.name;
                            if (data[index].consultantDocumentsStatus?.isNotEmpty ?? false) {
                              status = data[index].consultantDocumentsStatus?.first.documentStatus ?? "";
                            }
                            bool isClickable = (status == DocumentStatus.pending.name || status == DocumentStatus.rejected.name);
                            return Opacity(
                              opacity: isClickable ? 1 : 0.5,
                              child: CardListViewDesign(
                                edgeInsets: const EdgeInsets.symmetric(vertical: 10),
                                onClick: () {
                                  if(isClickable) {
                                    Navigator.pushNamed(context, AppRoutes.documentUploadScreen, arguments: data[index].toJson());
                                  }
                                },
                                customWidget:
                                    commonCardChildView(context: context, image: Icons.featured_play_list, title: data[index].documents?.name ?? "", description: "( $status )",descriptionColor: Colors.black,),
                              ),
                            );
                          },
                        ),
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () => Center(child: CircularProgressIndicator())),
              ],
            ),
          ),
          Positioned(
              child: Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: CommonBottomAlignWidget(
                    setBottomWidget: CustomButton(CustomColor.white, CustomColor.primaryPurple, tr(context).continu, () {}, 10, 1, MediaQuery.of(context).size.width),
                  ))),
        ],
      ), //Center
    );
  }
}
