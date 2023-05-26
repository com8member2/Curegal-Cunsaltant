
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../shared/custom_image_view.dart';
import '../../../../utility/utility.dart';
import 'consultation_item.dart';

class DoctorsCategory extends StatelessWidget {
  final String title;
  final ValueSetter onClick;

  DoctorsCategory(this.title, this.onClick, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> moreConsultationData() async {
      PostgrestResponse<dynamic> resd = await doctorReadData();
      return resd.data as List<dynamic>;
    }

    return FutureBuilder(
      future: moreConsultationData(),
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
        }
        else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(height: 10),
                SizedBox(height: 100,child: ListView.builder(
                  itemCount: snapshot.data?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return  Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        children: [
                         CustomImageView(url: snapshot.data?[index]['image'],),
                          SizedBox(
                            width: 80,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              child: Text(
                                snapshot.data?[index]['name'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },),)
              ],
            ),
          );
        }


      },
    );
  }


  Future<PostgrestResponse<dynamic>> doctorReadData() async {
    PostgrestResponse<dynamic> idRes =
    await Supabase.instance.client
        .from('consultation_category')
        .select()
        .eq('consultant_persons_id', 3)
        .is_('image', null)
        .execute();

    var temp= idRes.data.map((row) => row['id']).toList();
    print("list ${temp}");

    PostgrestResponse<dynamic> res =
    await Supabase.instance.client
        .from('consultation_sub_categories')
        .select()
        .eq('consultation_category_id', temp[0])
        .execute();


    //var tempName = res.data.map((row) => row['name']).toList();
    //print("list name  ${tempName}");

    return res;
  }

}


