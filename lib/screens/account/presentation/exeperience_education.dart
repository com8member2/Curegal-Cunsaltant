import 'package:consultation_curegal/consatant/ColorConstant.dart';
import 'package:consultation_curegal/screens/account/presentation/widgets/add_education.dart';
import 'package:consultation_curegal/screens/account/presentation/widgets/add_experience.dart';

import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../consatant/Constants.dart';


class EducationnExperience extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var schoolOrCollageName = useState("");
    var degree = useState("");
    var year = useState("");



    Future<List<dynamic>> education() async {
      PostgrestResponse<dynamic> res = await getEducation();
      return res.data as List<dynamic>;
    }

    Future<List<dynamic>> experience() async {
      PostgrestResponse<dynamic> res = await getExperience();
      return res.data as List<dynamic>;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70.0, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: education(),
                builder: (context, educationSnapshot) {
                  if (educationSnapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  } else if (educationSnapshot.hasError) {
                    return Text('Error: ${educationSnapshot.error}');
                  } else if (!educationSnapshot.hasData || educationSnapshot.data!.isEmpty) {
                    return Center(child: Text('No Data found.'));
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: CardListViewDesign(
                            onClick: () {},
                            customWidget: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Text(
                                    tr(context).education,
                                    style: commonTextStyle(context, 16),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () async {
                                      var temp = await showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const AddEducationDialogBox();
                                        },
                                      );
                                      schoolOrCollageName.value = temp['schoolOrCollege'];
                                      degree.value = temp['degree'];
                                      year.value = temp['year'];
                                    },
                                    child: Icon(
                                      Icons.add_circle_outline,
                                      color: CustomColor.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (educationSnapshot.data!.isNotEmpty)
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: educationSnapshot.data?.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (educationSnapshot.data?[index]['education_university'] != null)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                                      child: Text(
                                        educationSnapshot.data?[index]['education_university'],
                                        overflow: TextOverflow.ellipsis,
                                        style: commonTextStyle(context, 14, FontWeight.normal),
                                      ),
                                    ),
                                  if (educationSnapshot.data?[index]['education_degree'] != null)
                                    Text(educationSnapshot.data?[index]['education_degree'],
                                        overflow: TextOverflow.ellipsis, style: commonTextStyle(context, 14, FontWeight.normal)),
                                  if (educationSnapshot.data?[index]['education_completed_year'] != null)
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                                      child: Row(
                                        children: [
                                          Text(tr(context).completed_year,
                                              overflow: TextOverflow.ellipsis, style: commonTextStyle(context, 14, FontWeight.normal)),
                                          Text(educationSnapshot.data![index]['education_completed_year'].toString(),
                                              overflow: TextOverflow.ellipsis, style: commonTextStyle(context, 14, FontWeight.normal)),
                                        ],
                                      ),
                                    ),
                                  if (educationSnapshot.data?[index]['education_completed_year'] != null &&
                                      educationSnapshot.data?[index]['education_degree'] != null &&
                                      educationSnapshot.data?[index]['education_university'] != null)
                                    Divider(
                                      height: 10,
                                      color: CustomColor.black,
                                      thickness: 0.1,
                                    )
                                ],
                              );
                            },
                          ),
                      ],
                    );
                  }
                },
              ),
              FutureBuilder(
                future: experience(),
                builder: (context, experienceSnapshot) {
                  if (experienceSnapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  } else if (experienceSnapshot.hasError) {
                    return Text('Error: ${experienceSnapshot.error}');
                  } else if (!experienceSnapshot.hasData || experienceSnapshot.data!.isEmpty) {
                    return Center(child: Text('No Data found.'));
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CardListViewDesign(
                            onClick: () {},
                            customWidget: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Text(
                                    tr(context).experience,
                                    style: commonTextStyle(context, 16),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () async {
                                      var experience = await showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const AddExperinceDialogBox();
                                        },
                                      );
                                    },
                                    child: Icon(
                                      Icons.add_circle_outline,
                                      color: CustomColor.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (experienceSnapshot.data!.isNotEmpty)
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: experienceSnapshot.data?.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (experienceSnapshot.data?[index]['experience_clinic_name'] != null)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                                        child: Text(
                                          experienceSnapshot.data?[index]['experience_clinic_name'],
                                          style: commonTextStyle(context, 18, FontWeight.bold),
                                        ),
                                      ),
                                    if (experienceSnapshot.data?[index]['experience_location'] != null)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                                        child: Text(
                                          experienceSnapshot.data?[index]['experience_location'],
                                          style: commonTextStyle(context, 14, FontWeight.normal),
                                        ),
                                      ),
                                    if (experienceSnapshot.data?[index]['experience_start'] != null &&
                                        experienceSnapshot.data?[index]['experience_end'] != null)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                                        child: Text(
                                          "${experienceSnapshot.data?[index]['experience_start']} - ${experienceSnapshot.data?[index]['experience_end']}",
                                          style: commonTextStyle(context, 14, FontWeight.normal),
                                        ),
                                      ),
                                    if (experienceSnapshot.data?[index]['experience_clinic_name'] != null &&
                                        experienceSnapshot.data?[index]['experience_location'] != null &&
                                        experienceSnapshot.data?[index]['experience_start'] != null &&
                                        experienceSnapshot.data?[index]['experience_end'] != null)
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Divider(
                                          height: 10,
                                          color: CustomColor.black,
                                          thickness: 0.1,
                                        ),
                                      )
                                  ],
                                );
                              },
                            )
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<PostgrestResponse<dynamic>> getEducation() async {

    PostgrestResponse<dynamic> res = await Constants.supabaseClient
        .from('consultant_education')
        .select()
        .eq("cosultant_id",  Constants.supabaseClient.auth.currentSession?.user.id)
        .execute();
    return res;
  }

  Future<PostgrestResponse<dynamic>> getExperience() async {
    PostgrestResponse<dynamic> res = await Constants.supabaseClient.from('consultant_education_experience').select()
        .eq("cosultant_id",  Constants.supabaseClient.auth.currentSession?.user.id).
    execute();
    return res;
  }
}
