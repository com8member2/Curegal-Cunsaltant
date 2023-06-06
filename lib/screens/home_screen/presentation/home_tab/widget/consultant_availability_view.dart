import 'dart:developer';

import 'package:consultation_curegal/consatant/ColorConstant.dart';
import 'package:consultation_curegal/screens/home_screen/controller/home_tab_controller.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../shared/widget/shared_small_widgets.dart';
import '../../../../../utility/utility.dart';
import '../../../model/consultat_availability_entity.dart';

class ConsultantAvailabilityView extends HookConsumerWidget {
  const ConsultantAvailabilityView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var slotPriceController = useTextEditingController();
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Theme(
          data: FlexThemeData.light(scheme: FlexScheme.greyLaw),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("Create Your Schedule", style: Theme.of(context).textTheme.titleLarge),
                  ),
                  ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => CheckBoxView(index),
                      separatorBuilder: (context, index) => const Divider(indent: 20, endIndent: 20),
                      itemCount: 7),
                  TextFieldWithLable(
                    "test",
                    "hint",
                    double.maxFinite,
                    slotPriceController,
                    (value) => null,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class CheckBoxView extends HookConsumerWidget {
  final int index;
  const CheckBoxView(
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var item = ref
        .watch(consultantAvailabilityProvider.select((value) => value.firstWhere((element) => element.dayOfWeek == index, orElse: () => ConsultantAvailabilityEntity())));
    var isSelected = useState(item.time?.isNotEmpty ?? false);
    return GestureDetector(
      onTap: () {
        isSelected.value = !isSelected.value;
        if (isSelected.value) {
          ref.read(consultantAvailabilityProvider.notifier).addSlot(index);
        } else {
          ref.read(consultantAvailabilityProvider.notifier).removeAll(item);
        }
      },
      child: Row(
        children: [
          Checkbox(
            activeColor: CustomColor.primaryPurple,
            value: isSelected.value,
            onChanged: (bool? value) {
              isSelected.value = value ?? false;
              if (isSelected.value) {
                ref.read(consultantAvailabilityProvider.notifier).addSlot(index);
              } else {
                ref.read(consultantAvailabilityProvider.notifier).removeAll(item);
              }
            },
          ),
          Text(getName()??""),
          const SizedBox(width: 10),
          !isSelected.value
              ? const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Unavailable",
                    style: TextStyle(color: CustomColor.primaryPurple),
                  ),
                )
              : Flexible(child: ItemView( index)),
        ],
      ),
    );
  }

  String? getName() {
    switch(index){
      case 0: return "sun".toUpperCase();
      case 1: return "mon".toUpperCase();
      case 2: return "tue".toUpperCase();
      case 3: return "wed".toUpperCase();
      case 4: return "thu".toUpperCase();
      case 5: return "fri".toUpperCase();
      case 6: return "sat".toUpperCase();
    }
  }
}

class ItemView extends HookConsumerWidget {
  final int parentIndex;

  const ItemView(
    this.parentIndex, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var item = ref
        .watch(consultantAvailabilityProvider.select((value) => value.firstWhere((element) => element.dayOfWeek == parentIndex, orElse: () => ConsultantAvailabilityEntity()).time));
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: List.generate(
            item?.length??0,
            (index) => Row(
              children: [
                TimeSelectionView(initialTime: parseTimeOfDay(item?.elementAt(index).from ?? ""), onTimeSelected: (time) {}),
                const SizedBox(width: 15),
                TimeSelectionView(initialTime: parseTimeOfDay(item?.elementAt(index).to ?? ""), onTimeSelected: (time) {}),
                const SizedBox(width: 10),
                GestureDetector(
                    onTap: () => ref.read(consultantAvailabilityProvider.notifier).remove(parentIndex, index),
                    child: const Icon(Icons.close_rounded, color: CustomColor.ratingRed)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
            onTap: () => ref.read(consultantAvailabilityProvider.notifier).addSlot(parentIndex), child: const Icon(Icons.add, color: CustomColor.primaryPurple)),
      ],
    );
  }
}
