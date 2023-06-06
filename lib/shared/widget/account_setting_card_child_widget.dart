import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/material.dart';
import '../../consatant/ColorConstant.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class commonCardChildView extends HookWidget{

  final BuildContext context;
  final IconData image;
  final String title;
  final String description;
  final Color iconColor;
  final IconData? icon;
  final bool disabled;

  const commonCardChildView({super.key, required this.context,required this.title,required this.description,required this.image,this.iconColor = CustomColor.txtGray,this.icon = Icons.navigate_next_outlined,this.disabled= false});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
              child: Icon(image, size: 30, color: disabled ? Theme.of(context).disabledColor.withOpacity(0.2) :CustomColor.textBlack)),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 8, top: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: commonTextStyle(context, 16).copyWith(color: disabled ? Theme.of(context).disabledColor.withOpacity(0.2) : null),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0, right: 0, top: 7),
                  child: Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: disabled ? Theme.of(context).disabledColor.withOpacity(0.2) :iconColor, fontSize: 13),
                  ),
                )
              ],
            ),
          ),
        ),
        if(icon != null)
        Center(
            child: Icon(icon,color: iconColor, size: 30)),
        SizedBox(width: 20,)
      ],
    );
  }

}


