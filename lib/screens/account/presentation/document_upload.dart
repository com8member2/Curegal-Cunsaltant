import 'dart:developer';

import 'package:consultation_curegal/consatant/Constants.dart';
import 'package:consultation_curegal/screens/account/controller/document_controller.dart';
import 'package:consultation_curegal/screens/account/model/consultant_documents_entity.dart';
import 'package:consultation_curegal/shared/widget/custom_image_view.dart';
import 'package:consultation_curegal/shared/widget/shared_small_widgets.dart';
import 'package:consultation_curegal/shared/widget/textfield_decoration.dart';
import 'package:consultation_curegal/utility/utility.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../consatant/ColorConstant.dart';
import '../../../shared/widget/common_bottom_align.dart';
import '../../../shared/widget/custom_button.dart';

class DocumentUploadScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>(), []);

    Map<String, dynamic> args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final document = ConsultantDocumentsEntity.fromJson(args);

    var documentNoController = useTextEditingController();
    var expirationDateController = useTextEditingController();
    var registrationDateController = useTextEditingController();
    return Scaffold(
      appBar: customAppBarH(tr(context).document_upload, context, CustomColor.primaryPurple, CustomColor.white),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 120),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  screenHeadingSubtitle(document.documents?.name ?? "", document.documents?.description ?? ""),
                  if (document.isNumberRequired ?? false)
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                      child: TextFormField(
                        controller: documentNoController,
                        validator: (value) {
                          if ((document.isNumberRequired ?? false) && ((value?.isEmpty ?? true) || (value?.length ?? 0) < 4)) {
                            return "please Select Expiration Date";
                          }
                          return null;
                        },
                        decoration: textFieldDecoration(tr(context).document_number_hint, context),
                      ),
                    ),
                  if (document.isRegistrationDateRequired ?? false)
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                      child: TextFormField(
                        readOnly: true,
                        onTap: () async {
                          final DateTime? selectedDate =
                              await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now());
                          if (selectedDate != null) {
                            registrationDateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
                          }
                        },
                        controller: registrationDateController,
                        validator: (value) {
                          if ((document.isRegistrationDateRequired ?? false) && ((value?.isEmpty ?? true) || (value?.length ?? 0) < 4)) {
                            return "please Select Expiration Date";
                          }
                          return null;
                        },
                        decoration: textFieldDecoration(tr(context).registration_date_hint, context),
                      ),
                    ),
                  if (document.isExpirationDateRequired ?? false)
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                      child: TextFormField(
                        readOnly: true,
                        onTap: () async {
                          print("object");
                          final DateTime? selectedDate =
                              await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2100));
                          if (selectedDate != null) {
                            expirationDateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
                          }
                        },
                        controller: expirationDateController,
                        validator: (value) {
                          if ((document.isExpirationDateRequired ?? false) && ((value?.isEmpty ?? true) || (value?.length ?? 0) < 4)) {
                            return "please Select Expiration Date";
                          }
                          return null;
                        },
                        decoration: textFieldDecoration(tr(context).expiration_date_hint, context),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "${tr(context).maxSize} 3mb",
                      style: commonTextStyle(context, 14, FontWeight.normal, Colors.red),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 20),
                    child: DottedBorder(
                      color: CustomColor.black,
                      borderType: BorderType.RRect,
                      dashPattern: [8, 5, 2, 5],
                      radius: const Radius.circular(12),
                      child: GestureDetector(
                        child: Container(
                            height: 160,
                            decoration: BoxDecoration(color: CustomColor.lightGray.withOpacity(0.4), borderRadius: BorderRadius.circular(12)),
                            width: MediaQuery.of(context).size.width,
                            // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                            child: Builder(builder: (context) {
                              var imageFileVal = ref.watch(documentControllerProvider);
                              if (imageFileVal.path.isNotEmpty && !imageFileVal.path.contains("pdf")) {
                                return Image.file(imageFileVal, fit: BoxFit.contain, filterQuality: FilterQuality.low);
                              } else if (imageFileVal.path.contains(".pdf")) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.image_outlined, size: 40),
                                        Text(imageFileVal.uri.path.isNotEmpty ? "" : tr(context).select_document_text,
                                            style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 3, overflow: TextOverflow.ellipsis),
                                        Text(imageFileVal.uri.path.isNotEmpty ? imageFileVal.uri.path : tr(context).document_type,
                                            maxLines: 3, overflow: TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.image_outlined, size: 40),
                                      Text(tr(context).select_document_text,
                                          style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 3, overflow: TextOverflow.ellipsis),
                                      Text(document.documents?.format ?? ""),
                                    ],
                                  ),
                                );
                              }
                            })),
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) => const BottomButtonView(),
                          );
                        },
                      ),
                    ),
                  ),
                  Text(
                    tr(context).example,
                    style: commonTextStyle(context, 14, FontWeight.normal, Colors.red),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: CustomImageView(
                      width: 200,
                      url: document.documents?.image ?? "",
                      imagePath: "assets/images/doctor.png",
                    ),
                  )
                ]),
              ),
            ),
          ),
          Positioned(
              child: Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: CommonBottomAlignWidget(
                    setBottomWidget: CustomButton(CustomColor.white, CustomColor.primaryPurple, tr(context).submit, () async {
                      if (formKey.currentState?.validate() ?? false) {
                        if (ref.read(documentControllerProvider).path.isNotEmpty) {
                          ref
                              .read(uploadDocumentProvider({
                                if (document.isNumberRequired ?? false) "document_number": documentNoController.text,
                                if (document.isRegistrationDateRequired ?? false) "document_registration_date": registrationDateController.text,
                                if (document.isExpirationDateRequired ?? false) "document_expiration_date": expirationDateController.text,
                              },document));
                        } else {
                          EasyLoading.showInfo("Please Select image to upload.");
                        }
                      }
                    }, 10, 1, MediaQuery.of(context).size.width),
                  ))),
        ],
      ),
    );
  }
}

class BottomButtonView extends HookConsumerWidget {
  const BottomButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // height: 250,
      padding: const EdgeInsets.only(left: 30.0, top: 20.0, right: 30.0, bottom: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: CustomButton(CustomColor.white, CustomColor.primaryPurple, tr(context).open_file_manager, () {
              Navigator.of(context).pop();
              ref.read(documentControllerProvider.notifier).getImageFromGallery();
            }, 10, 1, MediaQuery.of(context).size.width),
          ),
          CustomButton(CustomColor.white, CustomColor.primaryPurple, tr(context).open_camera, () async {
            Navigator.of(context).pop();
            await ref.read(documentControllerProvider.notifier).getImageFromCamera();
          }, 10, 1, MediaQuery.of(context).size.width)
        ],
      ),
    );
  }
}
