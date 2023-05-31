import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommonSearchBar extends HookConsumerWidget {
  CommonSearchBar({required this.title, this.size = 15.0});

  final String title;
  final double size;

  @override
  Widget build(BuildContext context,ref) {
    return Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: title,
              hintStyle: TextStyle(fontFamily: "productsunregular", fontSize: size, color: const Color(0xff929292)),
              icon: Image.asset("assets/images/search.png", height: 21, width: 21),
              iconColor: Colors.grey,
            ),
            style: const TextStyle(fontSize: 18),
          ),
        ));
  }
}
