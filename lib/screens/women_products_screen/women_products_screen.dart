
import 'package:consultation_curegal/screens/women_products_screen/widget/item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../consatant/ColorConstant.dart';
import '../../shared/shared_small_widgets.dart';
import '../../utility/utility.dart';

class WomenProductScreen extends HookWidget {
  const WomenProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarH("Women Products",context,CustomColor.white,CustomColor.black,true),
      body: GridView.builder(
        padding: const EdgeInsets.only(left: 10,right: 10),
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            childAspectRatio: 0.7,mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          return CommonProductItem(imageUrl: "assets/images/womenitem.png",productName:"Shaving Products");
        },
      ),
    );
  }
}
