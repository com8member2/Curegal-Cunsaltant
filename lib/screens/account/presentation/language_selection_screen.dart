import 'package:consultation_curegal/consatant/ColorConstant.dart';
import 'package:consultation_curegal/shared/widget/shared_small_widgets.dart';
import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../consatant/Constants.dart';
import '../../../shared/widget/common_bottom_align.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/common_bottom_align.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/shared_small_widgets.dart';


class LanguageSelect extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final selectedCheckboxes = useState<Set<dynamic>>({});
    final isChecked = useState(false);


    Future<List<dynamic>> laguages() async {
      PostgrestResponse<dynamic> res = await getAllLaguages();
      return res.data as List<dynamic>;
    }

    void toggleCheckbox(String languageName) {
      if (selectedCheckboxes.value.contains(languageName)) {
        selectedCheckboxes.value.remove(languageName);
      } else {
        selectedCheckboxes.value.add(languageName);
      }
    }

    return Scaffold(
      appBar: customAppBarH(tr(context).acct_languages, context, CustomColor.primaryPurple, CustomColor.white),
      body: Stack(
        children: [
          FutureBuilder(
            future: laguages(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No Data found.'));
              } else {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        screenHeadingSubtitle(tr(context).choose_your_language, tr(context).sub_heading_language_screen),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 120),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              isChecked.value = selectedCheckboxes.value.contains(snapshot.data?[index]['name']);
                              return Card(
                                color: isChecked.value ? CustomColor.primaryPurple : null,
                                child: ListTile(
                                  title: Text(
                                    snapshot.data?[index]['name'],
                                    style: commonTextStyle(context, 16, FontWeight.normal, isChecked.value ?CustomColor.white : CustomColor.black),
                                  ),
                                  trailing: Checkbox(
                                    activeColor: CustomColor.primaryPurple,
                                    checkColor: CustomColor.white,
                                    value: isChecked.value,
                                    onChanged: (value) {
                                      isChecked.value = !isChecked.value;
                                      toggleCheckbox(snapshot.data?[index]['name']);
                                    },
                                  ),

                                  onTap: () {
                                    toggleCheckbox(snapshot.data?[index]['name']);
                                  },
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            },
          ),
          Positioned(
              child: Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: CommonBottomAlignWidget(
                    setBottomWidget: CustomButton(
                        CustomColor.white,
                        CustomColor.primaryPurple,
                        tr(context).continu, () async {

                      final selectedValues = selectedCheckboxes.value.toList();

                      for (int i = 0; i < selectedCheckboxes.value.length; i++) {
                        await Constants.supabaseClient.from('consultant_languages')
                            .insert({'consultant_person_id' : Constants.supabaseClient.auth.currentUser?.id
                          ,'consultant_language_name': selectedValues[i]}).then((value) {

                        },);
                      }
                      isChecked.value=false;
                      selectedValues.clear();
                      selectedCheckboxes.value = {};
                    },
                        10,
                        1,
                        MediaQuery
                            .of(context)
                            .size
                            .width),
                  ))),
        ],
      ),
    );
  }

  Future<PostgrestResponse<dynamic>> getAllLaguages() async {
    PostgrestResponse<dynamic> res = await Constants.supabaseClient.from('languages').select().execute();
    return res;
  }
}


// class CheckboxSelectionScreen extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     final selectedCheckboxes = useState<Set<String>>({});
//     final checkboxes = [
//       'Checkbox 1',
//       'Checkbox 2',
//       'Checkbox 3',
//       'Checkbox 4',
//       'Checkbox 5',
//     ];
//
//     void toggleCheckbox(String checkbox) {
//       if (selectedCheckboxes.value.contains(checkbox)) {
//         selectedCheckboxes.value.remove(checkbox);
//       } else {
//         selectedCheckboxes.value.add(checkbox);
//       }
//     }
//
//     void retrieveSelectedCheckboxes() {
//       final selectedValues = selectedCheckboxes.value.toList();
//       print(selectedValues);
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Checkbox Selection'),
//       ),
//       body: ListView(
//         children: checkboxes.map((checkbox) {
//           final isChecked = selectedCheckboxes.value.contains(checkbox);
//
//           return ListTile(
//             title: Text(checkbox),
//             leading: Checkbox(
//               value: isChecked,
//               onChanged: (bool? value) {
//                 toggleCheckbox(checkbox);
//               },
//             ),
//             onTap: () {
//               toggleCheckbox(checkbox);
//             },
//           );
//         }).toList(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           retrieveSelectedCheckboxes();
//         },
//         child: Icon(Icons.check),
//       ),
//     );
//   }
// }

