

import 'package:consultation_curegal/screens/news_and_articles_screen/widget/common_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../consatant/ColorConstant.dart';
import '../../shared/common_search_bar.dart';
import '../../shared/custom_image_view.dart';
import '../../shared/shared_small_widgets.dart';

class NewsAndArticles extends HookWidget{
  const NewsAndArticles({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: customAppBarH("News & Articles",context),
    body: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
          child:  CommonSearchBar(title: "Search here..."),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: ListView(
              children: [
                const Text("Recent Blog",style: TextStyle(fontFamily: "productsunbold",fontSize: 17)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CustomImageView(height: 180,imagePath: "assets/images/doc.jpeg",)),
                ),
                //TODO date formate pendding
                const Text("23 April 2023",style: TextStyle(fontFamily: "inter",fontSize: 13,color: CustomColor.dateGray),),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0,),
                  child: Text("Girl's First Period",style: TextStyle(fontFamily: "interbold",fontSize: 18),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: RichText(text: const TextSpan(text: "Lorem ipsum dolor sit amet consectetur. "
                      "In imperdiet ac nibh platea integer risus vel. In sed laoreet lobortis ut."
                      " At pretium urna placerat vulputate. Curabitur amet feugiat arcu risus.",style: TextStyle(fontFamily: "inter",color: CustomColor.mediumGray)
                      ,children: <TextSpan>[
                        TextSpan(text: "Read More",style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline))
                      ])),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: CommonTab(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset("assets/images/doctor.png",fit: BoxFit.cover,height: 50,width: 50,)),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Jian Martin",style: TextStyle(fontFamily: "intersemibold")),
                          Text("Author",style: TextStyle(color: Color(0xff8E8E8E),fontFamily: "interregular"),)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
  }

}