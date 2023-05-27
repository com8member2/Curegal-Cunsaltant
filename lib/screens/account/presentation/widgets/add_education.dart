import 'package:consultation_curegal/consatant/Constants.dart';
import 'package:consultation_curegal/shared/textfield_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

import '../../../../consatant/ColorConstant.dart';
import '../../../../shared/custom_button.dart';
import '../../../../shared/custom_dropdown.dart';
import '../../../../utility/utility.dart';

class AddEducationDialogBox extends HookWidget {
  const AddEducationDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    var educationDegreeValue = useState("MD");
    var educationYearValue = useState("2011");

    final TextEditingController schoolOrCollageController = useTextEditingController();

    final degreeOptions = ["MA PGDC", "MD", "BHMS"];
    final yearOptions = ["2011", "2012", "2013"];

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: const Color(0xffFFFFFF),
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                TextFormField(
                  controller: schoolOrCollageController,
                  decoration: textFieldDecoration(tr(context).enter_school_collage_name_hint, context),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomDropdown(
                    value: educationDegreeValue.value,
                    items: degreeOptions,
                    hint: tr(context).chooce_degree,
                    onChanged: (value) {
                      educationDegreeValue.value = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: CustomDropdown(
                    value: educationYearValue.value,
                    items: yearOptions,
                    hint: tr(context).chooce_year,
                    onChanged: (value) {
                      educationYearValue.value = value;
                    },
                  ),
                ),
                CustomButton(CustomColor.white, CustomColor.primaryPurple, tr(context).submit, () async {
                  await Constants.supabaseClient.from('consultant_education').insert({
                    'cosultant_id' : Constants.supabaseClient.auth.currentUser?.id,
                    'education_university': schoolOrCollageController.text,
                    'education_degree' : educationDegreeValue.value,
                    'education_completed_year' : educationYearValue.value
                  });

                  Navigator.pop(context,
                      {"schoolOrCollege": schoolOrCollageController.text, "degree": educationDegreeValue.value, "year": educationYearValue.value});

                  print("data ${educationDegreeValue.value} & ${educationYearValue.value} ${schoolOrCollageController.text}");
                }, 10, 1, MediaQuery.of(context).size.width)
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
