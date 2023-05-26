import 'package:consultation_curegal/consatant/ColorConstant.dart';
import 'package:consultation_curegal/screens/account/presentation/widgets/add_education.dart';
import 'package:consultation_curegal/screens/account/presentation/widgets/add_experience.dart';
import 'package:consultation_curegal/shared/custom_chip_widget.dart';
import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../consultation/widget/dialog_medicine.dart';


class EducationnExperience extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var schoolOrCollageName = useState("");
    var degree = useState("");
    var year = useState("");

    var clinicName = useState("");
    var cityName = useState("");
    var country = useState("");
    var fromDate = useState("");
    var toDate = useState("");

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70.0, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
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
                  if (schoolOrCollageName.value.isNotEmpty) Text(schoolOrCollageName.value,overflow: TextOverflow.ellipsis,style: commonTextStyle(context, 14,FontWeight.normal),),
                  if (degree.value.isNotEmpty) Padding(
                    padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                    child: Text(degree.value,overflow: TextOverflow.ellipsis,style: commonTextStyle(context, 14,FontWeight.normal)),
                  ),
                  if (year.value.isNotEmpty) Row(
                    children: [
                      Text(tr(context).completed_year,overflow: TextOverflow.ellipsis,style: commonTextStyle(context, 14,FontWeight.normal)),
                      Text(year.value,overflow: TextOverflow.ellipsis,style: commonTextStyle(context, 14,FontWeight.normal)),
                    ],
                  )
                ],
              ),
              Padding(
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

                                clinicName.value = experience['clinicName'];
                                cityName.value = experience['city'];
                                country.value = experience['country'];
                                fromDate.value = experience['fromDate'];
                                toDate.value = experience['toDate'];

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

                    if(clinicName.value.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                        child: Text(clinicName.value,style: commonTextStyle(context, 18,FontWeight.bold),),
                      ),
                    if(cityName.value.isNotEmpty)
                      Text(cityName.value,style: commonTextStyle(context, 14,FontWeight.normal),),
                    if(country.value.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                        child: Text(country.value,style: commonTextStyle(context, 14,FontWeight.normal),),
                      ),
                    if(fromDate.value.isNotEmpty)
                      Text(fromDate.value,style: commonTextStyle(context, 14,FontWeight.normal),),
                    if(toDate.value.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                        child: Text(toDate.value,style: commonTextStyle(context, 14,FontWeight.normal),),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
