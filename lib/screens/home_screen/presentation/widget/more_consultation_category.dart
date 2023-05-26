import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../routing/app_routes.dart';
import '../../../../utility/utility.dart';
import 'consultation_item.dart';

class MoreConsultationCategory extends StatelessWidget {
  final String title;

  MoreConsultationCategory(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> moreConsultationData() async {
      PostgrestResponse<dynamic> res = await moreConsultantdData();
      return res.data as List<dynamic>;
    }

    return FutureBuilder(
      future: moreConsultationData(),
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 10),
              snapshot.data != null ?
              GridView.builder(
                itemCount: snapshot.data!.length - 6,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1),
                itemBuilder: (context, index) {
                  var tempIndex = index + 6;
                  return ConsultationItem(
                    onClick: () {
                      Navigator.pushNamed(context, AppRoutes.consultationCategory, arguments: {"id" : snapshot.data?[tempIndex]['id']});
                    },
                    name: snapshot.data?[tempIndex]['name'],
                    imageUrl: snapshot.data?[tempIndex]['image'],
                    txtColor:snapshot.data?[tempIndex]['text_colour'],
                  );
                },
              ):Container()
            ],
          ),
        );
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
