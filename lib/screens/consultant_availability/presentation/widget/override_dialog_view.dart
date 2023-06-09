import 'package:consultation_curegal/consatant/ColorConstant.dart';
import 'package:consultation_curegal/screens/consultant_availability/controller/availability_override_controller.dart';
import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'checkbox_item_view.dart';

class OverrideConsumerView extends HookConsumerWidget {
  const OverrideConsumerView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<List<DateTime>> dateList = useState([]);
    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "Select Dates to override",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Divider(),
              SfDateRangePicker(
                onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
                  if (dateRangePickerSelectionChangedArgs.value is List<DateTime>) {
                    dateList.value = (dateRangePickerSelectionChangedArgs.value);
                  }
                },
                selectionMode: DateRangePickerSelectionMode.multiple,
                enablePastDates: false,
                showNavigationArrow: true,
                monthCellStyle: const DateRangePickerMonthCellStyle(todayTextStyle: TextStyle(color: CustomColor.darkPurple)),
                toggleDaySelection: false,
                todayHighlightColor: CustomColor.darkPurple,
                selectionColor: CustomColor.darkPurple,
              ),
              Text(
                tr(context).hours,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                tr(context).hours_des,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              CheckBoxView(
                ref.watch(availabilityOverrideControllerProvider),
                add: () {
                  ref.read(availabilityOverrideControllerProvider.notifier).addSlot();
                },
                remove: (index) {
                  ref.read(availabilityOverrideControllerProvider.notifier).remove(index);
                },
                removeAll: () {
                  ref.read(availabilityOverrideControllerProvider.notifier).removeAll();
                },
                onFromTimeSelected: (index, time) {
                  ref.read(availabilityOverrideControllerProvider.notifier).updateDateFrom(index, time);
                },
                onToTimeSelected: (index, time) {
                  ref.read(availabilityOverrideControllerProvider.notifier).updateDateTo(index, time);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(side: const BorderSide(color: CustomColor.darkPurple)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Close",
                          style: TextStyle(color: CustomColor.darkPurple),
                        )),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(backgroundColor: CustomColor.darkPurple),
                        onPressed: () {
                          ref.read(availabilityOverrideControllerProvider.notifier).addOverriddenData(context,dateList.value);
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: CustomColor.white),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

