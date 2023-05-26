
import 'package:flutter/cupertino.dart';

import '../utility/utility.dart';

class CommonBottomAlignWidget extends StatelessWidget{
  final Widget setBottomWidget;
  const CommonBottomAlignWidget({super.key, required this.setBottomWidget});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Container(
        decoration: shadow(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: setBottomWidget,
        ),
      ),
    );
  }
}