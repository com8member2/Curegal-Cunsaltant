
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../consatant/ColorConstant.dart';
import '../../../routing/app_routes.dart';
import '../../../shared/custom_image_view.dart';
import '../../../shared/shared_small_widgets.dart';
import '../../../utility/utility.dart';

class Categories extends HookWidget {
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context)?.settings.arguments as Map;
    final int id = args['id'];
    print("id in category ${id}");

    Future<List<dynamic>> categoriesData() async {
      PostgrestResponse<dynamic> resd = await categoryData(id);
      return resd.data as List<dynamic>;
    }

    return Scaffold(
        appBar: customAppBarH("Physical Fitness", context, CustomColor.white, Colors.black, true),
        body: FutureBuilder(
          future: categoriesData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No Data found.'));
            } else {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return
                             Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      Navigator.pushNamed(context, AppRoutes.consultationDoctorsList);
                                    },
                                    horizontalTitleGap: 0,
                                    leading: CustomImageView(url: snapshot.data?[index]['image'],height: 20,width: 20,),
                                    title: Text(snapshot.data?[index]['name'], style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
                                    trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20),
                                  ),
                                  Divider(
                                    color: Colors.black,
                                    indent: 20,
                                    endIndent: 15,
                                    height: 0,
                                  )
                                ],
                              );
                      },
                    ),
                  )
                ],
              );
            }
          },
        ));
  }

  Future<PostgrestResponse<dynamic>> categoryData(int id) async {
    PostgrestResponse<dynamic> res =
        await Supabase.instance.client.from('consultation_sub_categories').select().eq('consultation_category_id', id).execute();
    return res;
  }
}
