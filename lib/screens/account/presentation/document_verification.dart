import 'dart:developer';
import 'package:consultation_curegal/consatant/ColorConstant.dart';
import 'package:consultation_curegal/consatant/Constants.dart';
import 'package:consultation_curegal/screens/account/controller/document_controller.dart';
import 'package:consultation_curegal/shared/widget/shared_small_widgets.dart';
import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../routing/app_routes.dart';
import '../../../shared/widget/account_setting_card_child_widget.dart';
import '../../../shared/widget/common_bottom_align.dart';
import '../../../shared/widget/custom_button.dart';

class DocumentsVerificationScreen extends HookConsumerWidget {
  const DocumentsVerificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var personType = ModalRoute.of(context)?.settings.arguments as int;

    var documents = ref.watch(getDocumentsProvider(personType));

    return Scaffold(
      appBar: customAppBarH(tr(context).document_verify, context,backgroundColor:  CustomColor.primaryPurple, textColor: CustomColor.white),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text(
                tr(context).remaining_desc,
                style: TextStyle(fontSize: 18, color: CustomColor.textBlack),
              ),
            ),
            documents.when(
                data: (data) => Expanded(
                  child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          String status = DocumentStatus.pending.name;
                          String rejectedMessage = "";
                          if (data[index].consultantDocumentsStatus?.isNotEmpty ?? false) {
                            status = (data[index].consultantDocumentsStatus?.first.documentStatus ?? "");
                            if ((data[index].consultantDocumentsStatus?.first.documentStatusMessage ?? "").isNotEmpty) {
                              rejectedMessage = (data[index].consultantDocumentsStatus?.first.documentStatusMessage ?? "");
                            }
                          }
                          bool isClickable = (status == DocumentStatus.pending.name || status == DocumentStatus.rejected.name);
                          return Opacity(
                            opacity: isClickable ? 1 : 0.5,
                            child: CardListViewDesign(
                              edgeInsets: const EdgeInsets.symmetric(vertical: 10),
                              onClick: () {
                                if (isClickable) {
                                  Navigator.pushNamed(context, AppRoutes.documentUploadScreen, arguments: data[index].toJson());
                                }
                              },
                              customWidget: commonCardChildView(
                                context: context,
                                image: Icons.featured_play_list,
                                title: data[index].documents?.name ?? "",
                                description: "( $status ) $rejectedMessage",
                                iconColor: getColor(status),
                                icon: getIcon(status),
                              ),
                            ),
                          );
                        },
                      ),
                ),
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => Center(child: CircularProgressIndicator())),
          ],
        ),
      ), //Center
    );
  }

  getIcon(String status) {
    if (status == DocumentStatus.rejected.name) {
      return Icons.error_outline_rounded;
    }
    if (status == DocumentStatus.approved.name) {
      return Icons.done_rounded;
    }
    if (status == DocumentStatus.uploaded.name) {
      return null;
    }
    return Icons.keyboard_arrow_right;
  }

  getColor(String status) {
    if (status == DocumentStatus.rejected.name) {
      return Colors.red;
    }
    if (status == DocumentStatus.approved.name) {
      return CustomColor.mediumGreen;
    }
      return CustomColor.txtGray;
    }
}
