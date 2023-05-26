import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../routing/app_routes.dart';
import '../../../../utility/utility.dart';
import 'consultation_item.dart';

class ConsultationCategory extends StatelessWidget {
  final String title;



  ConsultationCategory(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> consultationData() async {
      PostgrestResponse<dynamic> res = await moreConsultantdData();
      return res.data as List<dynamic>;
    }

    return FutureBuilder(
      future: consultationData(),
      builder: (context, snapshot) {

    if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(child: Container(
      height: 30,
      width: 30,
      child: LinearProgressIndicator(
        color: Colors.grey.shade200,
        backgroundColor: Colors.grey.shade100,
      ),
    ),);
    }
    else if (snapshot.hasError) {
    return Text('Error: ${snapshot.error}');
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
    return Center(child: Text('No Data found.'));
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            const SizedBox(height: 15),

            GridView.builder(
                itemCount: 6,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1),
                itemBuilder: (context, index) =>
                snapshot.data?[index]['image'] != null && snapshot.data?[index]['text_colour'] != null?
                ConsultationItem(
                  onClick: () {
                    Navigator.pushNamed(context, AppRoutes.consultationCategory,arguments: {"id" : snapshot.data?[index]['id']});
                  },
                  name: snapshot.data?[index]['name'],
                  imageUrl:snapshot.data?[index]['image'],
                  txtColor:snapshot.data?[index]['text_colour'],
                ) : ConsultationItem(
                  onClick: () {
                    Navigator.pushNamed(context, AppRoutes.consultationCategory,arguments: {"id" : snapshot.data?[index]['id']});
                  },
                  name: snapshot.data?[index]['name'],
                  imageUrl:"assets/images/image_not_found.jpg",
                  txtColor:snapshot.data?[index]['text_colour'],
                ))
          ],
        ),
      );
    }
      },
    );
  }

  Future<PostgrestResponse<dynamic>> moreConsultantdData() async {
    PostgrestResponse<dynamic> res = await Supabase.instance.client
        .from("consultation_category")
        .select().neq("name", "Doctor Consultation")
        .execute();
    return res;
  }


}
