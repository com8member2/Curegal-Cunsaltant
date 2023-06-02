import 'package:consultation_curegal/consatant/Constants.dart';
import 'package:consultation_curegal/shared/widget/textfield_decoration.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../consatant/ColorConstant.dart';
import '../../../../shared/controller/user_profile.dart';
import '../../../../shared/widget/custom_button.dart';
import '../../../../shared/widget/custom_dropdown.dart';
import '../../../../shared/widget/custom_button.dart';
import '../../../../shared/widget/custom_dropdown.dart';
import '../../../../shared/widget/textfield_decoration.dart';
import '../../../../utility/utility.dart';

class AddExperinceDialogBox extends HookConsumerWidget {
  const AddExperinceDialogBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cityValue = useState("Rajkot");
    var countryValue = useState("India");

    final cityOptions = ["Rajkot", "Ahemdabad", "Jamnagar"];
    final countryOptions = ["India", "Japan", "US"];

    final clinicNameController = useTextEditingController();
    final fromDateController = useTextEditingController();
    final toDateController = useTextEditingController();

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
                Center(
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 20, top: 10),
                        child: Text(
                          "Add experience",
                          style: commonTextStyle(context, 16, FontWeight.bold),
                        ))),
                TextFormField(
                  controller: clinicNameController,
                  decoration: textFieldDecoration(tr(context).clinic_hint, context),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomDropdown(
                    value: cityValue.value,
                    items: cityOptions,
                    hint: tr(context).chooce_degree,
                    onChanged: (value) {
                      cityValue.value = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: CustomDropdown(
                    value: countryValue.value,
                    items: countryOptions,
                    hint: tr(context).chooce_year,
                    onChanged: (value) {
                      countryValue.value = value;
                    },
                  ),
                ),
                Text(tr(context).from, overflow: TextOverflow.ellipsis, style: commonTextStyle(context, 16, FontWeight.normal)),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 10),
                  child: TextFormField(
                    enableInteractiveSelection: false,
                    controller: fromDateController,
                    showCursor: false,
                    scrollPadding: EdgeInsets.only(bottom: 130),
                    decoration: textFieldDecoration(tr(context).from, context),
                    validator: (value) {
                      if (fromDateController.text.isEmpty) {
                        return tr(context).date_select_error;
                      } else {
                        return null;
                      }
                    },
                    onTap: () async {
                      final DateTime? selectedDate =
                          await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2100));

                      if (selectedDate != null) {
                        final DateFormat formatter = DateFormat('dd/MM/yyyy');
                        final String formattedDate = formatter.format(selectedDate);

                        fromDateController.text = formattedDate.toString();
                      }
                    },
                  ),
                ),
                Text(tr(context).to, overflow: TextOverflow.ellipsis, style: commonTextStyle(context, 16, FontWeight.normal)),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 20),
                  child: TextFormField(
                    enableInteractiveSelection: false,
                    controller: toDateController,
                    showCursor: false,
                    scrollPadding: EdgeInsets.only(bottom: 130),
                    decoration: textFieldDecoration(tr(context).to, context),
                    validator: (value) {
                      if (toDateController.text.isEmpty) {
                        return tr(context).date_select_error;
                      } else {
                        return null;
                      }
                    },
                    onTap: () async {
                      final DateTime? selectedDate =
                          await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2100));

                      if (selectedDate != null) {
                        final DateFormat formatter = DateFormat('dd/MM/yyyy');
                        final String formattedDate = formatter.format(selectedDate);

                        toDateController.text = formattedDate.toString();
                      }
                    },
                  ),
                ),
                CustomButton(CustomColor.white, CustomColor.primaryPurple, tr(context).submit, () async {
                  await Constants.supabaseClient.from('consultant_education_experience').insert({
                    'cosultant_id' : Constants.supabaseClient.auth.currentUser?.id,
                    'experience_clinic_name': clinicNameController.text,
                    'experience_location' : '${cityValue.value}, ${countryValue.value}',
                    'experience_start' : fromDateController.text,
                    'experience_end' :toDateController.text
                  });

                  if(!(ref.read(userProfileProvider).educationExperienceStatus??false)) {
                    await ref.read(userProfileProvider.notifier).update({"education_experience_status": true});
                  }
                  Navigator.pop(context, {
                    "clinicName": clinicNameController.text,
                    "city": cityValue.value,
                    "country": countryValue.value,
                    "fromDate": fromDateController.text,
                    "toDate": toDateController.text
                  });

                  //print("data ${educationDegreeValue.value} & ${educationYearValue.value} ${clinicNameController.text}");
                }, 10, 1, MediaQuery.of(context).size.width)
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
