import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/material.dart';
import '../consatant/ColorConstant.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class commonCardChildView extends HookWidget{

  final BuildContext context;
  final IconData image;
  final String title;
  final String description;

  const commonCardChildView({super.key, required this.context,required this.title,required this.description,required this.image,});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Flexible(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Center(
                child: Icon(image, size: 30, color: CustomColor.txtGray)),
          ),
        ),
        Flexible(
          flex: 8,
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
                  style: commonTextStyle(context, 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0, right: 0, top: 7),
                  child: Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: CustomColor.txtGray, fontSize: 13),
                  ),
                )
              ],
            ),
          ),
        ),
        const Flexible(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.only(left: 0),
            child: Center(
                child: Icon(Icons.navigate_next_outlined,color: CustomColor.txtGray, size: 30)),
          ),
        ),
      ],
    );
  }

}


