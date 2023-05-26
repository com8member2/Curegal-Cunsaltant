import 'dart:ffi';


import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../consatant/ColorConstant.dart';
import '../../../../shared/custom_image_view.dart';
import 'see_all_row.dart';

class CommonHorizontalList extends HookConsumerWidget {
  final String title;
  final String contentTitle;
  final bool flag;
  final String imageUrl;
  final String description;

  const CommonHorizontalList(this.flag,this.title,this.contentTitle,this.imageUrl,this.description, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SeeAllHeading(title, onSeeAllClick: () {}),
        SizedBox(
          height: flag ? 280 : 260,
          child: ListView.separated(
              padding: EdgeInsets.only(bottom: 20, left: 10, right: 10),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CommonHorizontalListItem(flag,contentTitle,imageUrl,description,),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: 7),
        )
      ],
    );
  }
}

class CommonHorizontalListItem extends HookConsumerWidget {
  final bool flag;
  final String title;
  final String imageUrl;
  final String description;

  const CommonHorizontalListItem(this.flag,this.title,this.imageUrl,this.description, {Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 250,
      height: 200,
      child: Card(
        color: flag ? null : CustomColor.backgroundColor,
        borderOnForeground: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), side: flag ? BorderSide(width: 1.5, color: CustomColor.productItemBlue) : BorderSide.none),
        elevation: 0,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(
              height: 140,
              width: double.maxFinite,
              url: imageUrl,
              radius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: flag ? null : Colors.white),
                  maxLines: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: flag ? 10 : 0),
                  child: Text(
                    description,
                    style: TextStyle(fontSize: 14, color: flag ? CustomColor.mediumGray : CustomColor.lightGray),
                    maxLines: 3,
                  ),
                ),
                const SizedBox(height: 4),
                if (flag)
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.ios_share_outlined,
                        size: 16,
                        color: CustomColor.mediumGray,
                      ),
                      SizedBox(width: 3),
                      Text("00 Shares", style: TextStyle(color: CustomColor.mediumGray, fontSize: 12)),
                      Padding(
                          padding: EdgeInsets.only(left: 15, right: 5),
                          child: Icon(
                            Icons.circle,
                            color: CustomColor.txtGray,
                            size: 7,
                          )),
                      Icon(
                        Icons.access_time,
                        size: 16,
                        color: CustomColor.mediumGray,
                      ),
                      SizedBox(width: 3),
                      Text("00 mins", style: TextStyle(color: CustomColor.mediumGray, fontSize: 12)),
                    ],
                  )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
