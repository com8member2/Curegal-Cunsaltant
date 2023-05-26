import 'package:consultation_curegal/consatant/ColorConstant.dart';
import 'package:consultation_curegal/consatant/Constants.dart';
import 'package:consultation_curegal/shared/custom_chip_widget.dart';
import 'package:consultation_curegal/shared/shared_small_widgets.dart';
import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../shared/common_bottom_align.dart';
import '../../../shared/custom_button.dart';

class DoctorConsultantSubType extends HookWidget {
  @override
  Widget build(BuildContext context) {

    var consultant_id = useState(0);

    Future<List<dynamic>> categoriesData() async {
      PostgrestResponse<dynamic> resd = await categoryData(consultant_id.value);
      return resd.data as List<dynamic>;
    }

    // Future<List<dynamic>> consultationSubCategory() async {
    //   PostgrestResponse<dynamic> res2 = await categoryData(consultant_id.value);
    //   print("res 2 ${res2.data as List<dynamic>}");
    //   return res2.data as List<dynamic>;
    // }

    Future<List<dynamic>> moreConsultationData() async {
      PostgrestResponse<dynamic> res = await consultantdData();
      return res.data as List<dynamic>;
    }

    final selectedCheckboxIndex = useState(-1);
    final subItemSelectedValue = useState<List<String>>([]);
    final dataList = useState<List<Map<String, dynamic>>>([]);



    //final subItems = [];

    return Scaffold(
      appBar: customAppBarH("heading", context),
      body:Stack(
        children: [
          FutureBuilder<List<dynamic>>(
              future: moreConsultationData(),
              builder: (context, AsyncSnapshot<List<dynamic>> firstSnapshot) {
                if (firstSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (firstSnapshot.hasError) {
                  return Text('Error: ${firstSnapshot.error}');
                } else if (!firstSnapshot.hasData || firstSnapshot.data!.isEmpty) {
                  return Center(child: Text('No Data found.'));
                } else {
                  print("in eles");
                  return ListView.builder(
                    itemCount: firstSnapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CardListViewDesign(
                              onClick: () {},
                              customWidget: Row(
                                children: [
                                  Checkbox(
                                    activeColor: CustomColor.primaryPurple,
                                    checkColor: CustomColor.white,
                                    value: selectedCheckboxIndex.value == index,
                                    onChanged: (value) {
                                      consultant_id.value = firstSnapshot.data?[index]['id'];
                                      print("id ${consultant_id.value}");
                                      selectedCheckboxIndex.value = value! ? index : -1;
                                    },
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    firstSnapshot.data?[index]['name'],
                                    style: commonTextStyle(context, 16),
                                  ),
                                ],
                              ),
                            ),
                            if (selectedCheckboxIndex.value == index)
                              FutureBuilder<List<dynamic>>(
                                future: categoriesData(),
                                builder: (context, AsyncSnapshot<List<dynamic>> secondSnapshot) {
                                  if (secondSnapshot.connectionState == ConnectionState.waiting) {
                                    return Container();
                                  } else if (secondSnapshot.hasError) {
                                    return Text('Error: ${secondSnapshot.error}');
                                  } else if (!secondSnapshot.hasData || secondSnapshot.data!.isEmpty) {
                                    return SizedBox(
                                        height: MediaQuery.of(context).size.height / 7,
                                        child: Center(
                                            child: Text(
                                              tr(context).no_data_found,
                                              style: commonTextStyle(context, 16),
                                            )));
                                  } else {

                                    return Wrap(
                                      spacing: 10,
                                      children: List<Widget>.generate(
                                        secondSnapshot.data!.length,
                                            (index) {
                                          return Padding(
                                            padding: EdgeInsets.all(2),
                                            child: CustomChipWidget(
                                                secondSnapshot.data?[index]['name'], secondSnapshot.data?[index] == subItemSelectedValue, (value) {
                                              if (value){
                                                subItemSelectedValue.value.add(secondSnapshot.data?[index]['name']);
                                                print("selected chip ${subItemSelectedValue.value} ----- ${secondSnapshot.data?[index] == subItemSelectedValue}");
                                              }
                                            }),
                                          );
                                        },
                                      ),
                                    );
                                  }
                                },
                              )

                          ],
                        ),
                      );
                    },
                  );
                }
              }),
          Positioned(
              child: Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: CommonBottomAlignWidget(
                    setBottomWidget: CustomButton(CustomColor.white, CustomColor.primaryPurple, tr(context).submit, () async {

                      final List<Map<String, dynamic>> newDataList = [];
                        dataList.value.clear();
                        newDataList.clear();
                        for (int i = 1; i <= subItemSelectedValue.value.length; i++) {
                          newDataList.add({
                            'id': i,
                            'name': 'Item $i',
                          });
                        }
                        dataList.value = newDataList;
                        print("data list ${dataList.value}----${newDataList}");

                    }, 10, 1, MediaQuery.of(context).size.width),
                  ))),
        ],
      ),
    );
  }

  Future<PostgrestResponse<dynamic>> consultantdData() async {
    PostgrestResponse<dynamic> res = await Constants.supabaseClient.from("consultation_category").select().execute();
    return res;
  }

  Future<PostgrestResponse<dynamic>> categoryData(int id) async {
    PostgrestResponse<dynamic> res = await Constants.supabaseClient.from('consultation_sub_categories').select().eq('consultation_category_id', id).execute();
    return res;
  }




}





//
// class DataScreen extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     final client = useSupabase();
//
//     Future<List<dynamic>> fetchDataFromFirstTable() async {
//       final response = await client.from('table1').select().execute();
//       if (response.error != null) {
//         // Handle error for first table
//         print('Error fetching data from table1: ${response.error?.message}');
//         return [];
//       }
//       return response.data ?? [];
//     }
//
//     Future<List<dynamic>> fetchDataFromSecondTable() async {
//       final response = await client.from('table2').select().execute();
//       if (response.error != null) {
//         // Handle error for second table
//         print('Error fetching data from table2: ${response.error?.message}');
//         return [];
//       }
//       return response.data ?? [];
//     }
//
//     return FutureBuilder<List<dynamic>>(
//       future: fetchDataFromFirstTable(),
//       builder: (context, AsyncSnapshot<List<dynamic>> firstSnapshot) {
//         if (firstSnapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (firstSnapshot.hasError) {
//           return Center(child: Text('Error: ${firstSnapshot.error}'));
//         } else if (firstSnapshot.hasData) {
//           final firstTableData = firstSnapshot.data!;
//           return FutureBuilder<List<dynamic>>(
//             future: fetchDataFromSecondTable(),
//             builder: (context, AsyncSnapshot<List<dynamic>> secondSnapshot) {
//               if (secondSnapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               } else if (secondSnapshot.hasError) {
//                 return Center(child: Text('Error: ${secondSnapshot.error}'));
//               } else if (secondSnapshot.hasData) {
//                 final secondTableData = secondSnapshot.data!;
//                 // Process both table data and return your UI accordingly
//                 return Column(
//                   children: [
//                     Text('First Table Data: $firstTableData'),
//                     Text('Second Table Data: $secondTableData'),
//                   ],
//                 );
//               } else {
//                 return Center(child: Text('No data found.'));
//               }
//             },
//           );
//         } else {
//           return Center(child: Text('No data found.'));
//         }
//       },
//     );
//   }
// }
