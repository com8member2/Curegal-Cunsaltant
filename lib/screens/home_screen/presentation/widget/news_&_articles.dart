
import 'package:consultation_curegal/screens/home_screen/presentation/widget/see_all_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../utility/utility.dart';
import 'common_horizontal_list.dart';

class NewsAndArticles extends StatelessWidget {
  const NewsAndArticles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> articlesNewsData() async {
      //PostgrestResponse<dynamic> resd = await readData("articles_news");
      PostgrestResponse<dynamic> resd = await readData("news_articles");
      return resd.data as List<dynamic>;
    }

    return FutureBuilder(
      future: articlesNewsData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Container(
              height: 30,
              width: 30,
              child: LinearProgressIndicator(
                color: Colors.grey.shade200,
                backgroundColor: Colors.grey.shade100,
              ),
            ),
          );
        } else {
          return Column(
            children: [
              SeeAllHeading(tr(context).news_n_articles, onSeeAllClick: () {}),
              SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: snapshot.data?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if(index == 0){
                        return Padding(
                          padding: const EdgeInsets.only(left: 16, right: 8, top: 4),
                          child: CommonHorizontalListItem(
                            true,
                            snapshot.data?[index]["title"],
                            snapshot.data?[index]["images"],
                            snapshot.data?[index]["description"],
                          ),
                        );
                      }else if(index == snapshot.data!.length-1){
                        return Padding(
                          padding: const EdgeInsets.only(right: 16, top: 4),
                          child: CommonHorizontalListItem(
                            true,
                            snapshot.data?[index]["title"],
                            snapshot.data?[index]["images"],
                            snapshot.data?[index]["description"],
                          ),
                        );
                      }else{
                        return Padding(
                          padding: const EdgeInsets.only(top: 4, right: 8),
                          child: CommonHorizontalListItem(
                            true,
                            snapshot.data?[index]["title"],
                            snapshot.data?[index]["images"],
                            snapshot.data?[index]["description"],
                          ),
                        );
                      }
                    },
                  ))
            ],
          );
        }
      },
    );
  }
}
