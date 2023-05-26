
import 'package:consultation_curegal/screens/home_screen/presentation/widget/see_all_row.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../consatant/ColorConstant.dart';
import '../../../../shared/custom_image_view.dart';

class LabTestView extends HookConsumerWidget {
  final String title;

  const LabTestView(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SeeAllHeading(title, onSeeAllClick: () {}),
        SizedBox(
          height: 150,
          child: ListView.separated(
              padding: EdgeInsets.only(bottom: 20, left: 10, right: 10),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => LabTestItem(index),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: 7),
        )
      ],
    );
  }
}

class LabTestItem extends HookConsumerWidget {
  final int index;

  const LabTestItem(
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 270,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: index % 2 == 0 ? [CustomColor.blueGradient1, CustomColor.blueGradient2] : [CustomColor.pinkGradient1, CustomColor.pinkGradient2]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title \nccc",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                  maxLines: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  child: Text(
                    "SubtitleSu btitleSubt itleSu btitleSubtit leSubtitle Subtit leSubtitleS ubtitleSubt itleSubt itleSub title",
                    style: TextStyle(fontSize: 13, color: CustomColor.blueGradientTxt),
                    maxLines: 2,
                  ),
                ),
                Expanded(child: Align(alignment: Alignment.bottomLeft, child: Text("*T&C Apply", style: TextStyle(fontSize: 12, color: CustomColor.blueGradientTxt))))
              ],
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: CustomColor.lightOrange),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: Text("75% OFF", style: TextStyle(fontSize: 10, color: Colors.white)),
                ),
              ),
              Expanded(
                  child: CustomImageView(width: 50,
                margin: EdgeInsets.only(top: 5),
                url: 'https://via.placeholder.com/150',
              ))
            ],
          )
        ]),
      ),
    );
  }
}
