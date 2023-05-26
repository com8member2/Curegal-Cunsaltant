import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CommonTab extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> title = ["Periods", "Puberty", "Menstrual"];
    final List backgroundColor = [0x288377EC, 0x25EF4D89, 0x204574DD];
    final List color = [0xff8377EC, 0xffEF4D89, 0xff4574DD];
    return  Row(
            children: List<Widget>.generate(title.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Chip(
          label: Text(title[index]),
          backgroundColor: Color(backgroundColor[index]),
          labelStyle: TextStyle(color: Color(color[index])),
        ),
      );
    }));
  }
}
