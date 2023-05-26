import 'dart:math';
import 'package:consultation_curegal/screens/account/controller/document_controller.dart';
import 'package:consultation_curegal/shared/custom_image_view.dart';
import 'package:consultation_curegal/shared/shared_small_widgets.dart';
import 'package:consultation_curegal/shared/textfield_decoration.dart';
import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../consatant/ColorConstant.dart';
import '../../../consatant/Constants.dart';
import '../../../shared/common_bottom_align.dart';
import '../../../shared/custom_button.dart';
import 'package:dotted_border/dotted_border.dart';

class DocumentUploadScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>(), []);

    Map args = ModalRoute.of(context)?.settings.arguments as Map;

    final String documentName = args['documentName'];

    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop();
        return Future.value(true);
      }, // Empty Function.
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: customAppBarH(tr(context).document_upload, context, CustomColor.primaryPurple, CustomColor.white),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    screenHeadingSubtitle(documentName, tr(context).remaining_desc),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                      child: TextFormField(
                        decoration: textFieldDecoration(tr(context).document_number_hint, context),
                      ),
                    ),
                    Text(
                      "${tr(context).maxSize} 3mb",
                      style: commonTextStyle(context, 14, FontWeight.normal, Colors.red),
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
                                print("imageFileVal");
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
                                        Text(tr(context).document_type),
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
                        height: 90,
                        width: 150,
                        imagePath: "assets/images/doctor.png",
                        fit: BoxFit.fitWidth,
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
                      setBottomWidget:
                          CustomButton(CustomColor.white, CustomColor.primaryPurple, tr(context).submit, () async {}, 10, 1, MediaQuery.of(context).size.width),
                    ))),
          ],
        ),
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
      child: Column(mainAxisSize: MainAxisSize.min,
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
