import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../consatant/ColorConstant.dart';

class CommonProductItem extends HookConsumerWidget {
  const CommonProductItem({super.key, required this.imageUrl, required this.productName, this.backGroundColor = CustomColor.productItemBlue});

  final String imageUrl;
  final String productName;
  final Color backGroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffEAECFF), strokeAlign: BorderSide.strokeAlignInside),
          gradient: const LinearGradient(colors: [Color(0xfff2f6fd), Color(0xffF9FBFF)], begin: Alignment.centerLeft, end: Alignment.centerRight),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(15)), child: Image.asset(imageUrl)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9.0),
            child:
                Text(productName, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 16, fontFamily: "inter")),
          ),
          SubmitButton(
            submit: "Buy",
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(15),
            boxDecoration: BoxDecoration(
                boxShadow: [const BoxShadow(color: Color(0xffEAECFF), blurRadius: 1.0, offset: Offset(0, 3))],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            fontFamily: "interbold",
          )
        ],
      ),
    );
  }
}

class SubmitButton extends HookConsumerWidget {
  const SubmitButton({required this.submit, this.width, this.padding, this.boxDecoration, this.margin, this.textColor = Colors.black, this.fontFamily});

  final String submit;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Decoration? boxDecoration;
  final Color textColor;
  final String? fontFamily;

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(color: const Color(0xff8377ec), borderRadius: BorderRadius.circular(15)),
      child: Text(submit, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}
