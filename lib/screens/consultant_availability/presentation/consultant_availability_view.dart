import 'dart:developer';

import 'package:consultation_curegal/consatant/ColorConstant.dart';
import 'package:consultation_curegal/screens/consultant_availability/controller/overridden_list_controller.dart';
import 'package:consultation_curegal/screens/consultant_availability/presentation/widget/checkbox_item_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../shared/widget/shared_small_widgets.dart';
import '../../../utility/utility.dart';
import '../model/consultat_availability_entity.dart';
import 'widget/override_dialog_view.dart';
import '../controller/consultant_availability_controller.dart';

class ConsultantAvailabilityView extends HookConsumerWidget {
  const ConsultantAvailabilityView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>(), []);
    var slotPriceController = useTextEditingController();
    var slotTimeController = useTextEditingController();

    var price = ref.watch(slotPriceProvider);
    var time = ref.watch(slotTimeProvider);

    useEffect(() {
      slotPriceController.text = price ?? "";
      slotTimeController.text = time ?? "";
    }, [time, price]);

    return SafeArea(
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: FloatingActionButton(
                  backgroundColor: CustomColor.darkPurple,
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      ref.read(consultantAvailabilityProvider.notifier).saveChanges(slotPriceController.text, slotTimeController.text);
                    }
                  },
                  shape: const StadiumBorder(),
                  isExtended: true,
                  child: const Text(
                    "Save Changes",
                    style: TextStyle(color: CustomColor.white, fontSize: 20),
                  )),
            ),
          ),
          body: Hero(
            tag: "available",
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 80, right: 20, left: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text("Create Your Schedule", style: Theme.of(context).textTheme.titleLarge),
                      ),
                      const Divider(),
                      ListView.separated(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => _CheckBoxView(index),
                          separatorBuilder: (context, index) => const Divider(indent: 20, endIndent: 20),
                          itemCount: 7),
                      const Divider(
                        height: 25,
                      ),
                      TextFieldWithLable(
                        "Time per appointment",
                        "in min",
                        double.maxFinite,
                        slotTimeController,
                        (value) {
                          if (value?.isEmpty ?? true) {
                            return "Please Enter Time per appointment";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      const Divider(height: 25),
                      TextFieldWithLable(
                        "Fare per appointment",
                        "in rupee",
                        double.maxFinite,
                        slotPriceController,
                        (value) {
                          if (value?.isEmpty ?? true) {
                            return "Please Enter Fare per appointment";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      const Divider(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Date overrides", style: Theme.of(context).textTheme.titleMedium),
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: CustomColor.darkPurple), shape: const StadiumBorder(), padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20)),
                              onPressed: () {
                                showDialog(context: context, builder: (context) => const OverrideConsumerView());
                              },
                              child: const Text(
                                "Add a date override",
                                style: TextStyle(color: CustomColor.darkPurple),
                              ))
                        ],
                      ),
                      ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 10),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => CheckBoxView(
                                ref.watch(overriddenListControllerProvider.select((value) => value.elementAt(index))),
                                add: () {
                                  ref.read(overriddenListControllerProvider.notifier).addSlot(index);
                                },
                                remove: (int i) {
                                  ref.read(overriddenListControllerProvider.notifier).remove(index, i);
                                },
                                removeAll: () {
                                  ref.read(overriddenListControllerProvider.notifier).removeAll(index);
                                },
                                onFromTimeSelected: (int i, TimeOfDay time) {
                                  ref.read(overriddenListControllerProvider.notifier).updateDateFrom(index, i, time);
                                },
                                onToTimeSelected: (int i, TimeOfDay time) {
                                  ref.read(overriddenListControllerProvider.notifier).updateDateTo(index, i, time);
                                },
                              ),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: ref.watch(overriddenListControllerProvider).length)
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

class _CheckBoxView extends HookConsumerWidget {
  final int index;

  const _CheckBoxView(
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var item = ref
        .watch(consultantAvailabilityProvider.select((value) => value.firstWhere((element) => element.dayOfWeek == index, orElse: () => ConsultantAvailabilityEntity())));
    return GestureDetector(
      onTap: () {
        if (!(item.time?.isNotEmpty ?? false)) {
          ref.read(consultantAvailabilityProvider.notifier).addSlot(index);
        } else {
          ref.read(consultantAvailabilityProvider.notifier).removeAll(item);
        }
      },
      child: Row(
        children: [
          Checkbox(
            activeColor: CustomColor.darkPurple,
            value: item.time?.isNotEmpty ?? false,
            onChanged: (bool? value) {
              if (!(item.time?.isNotEmpty ?? false)) {
                ref.read(consultantAvailabilityProvider.notifier).addSlot(index);
              } else {
                ref.read(consultantAvailabilityProvider.notifier).removeAll(item);
              }
            },
          ),
          SizedBox(width: 40, child: Text(getName() ?? "")),
          const SizedBox(width: 10),
          !(item.time?.isNotEmpty ?? false)
              ? const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Unavailable",
                    style: TextStyle(color: CustomColor.darkPurple),
                  ),
                )
              : Flexible(
                  child: ItemView(index),
                ),
        ],
      ),
    );
  }

  String? getName() {
    switch (index) {
      case 0:
        return "sun".toUpperCase();
      case 1:
        return "mon".toUpperCase();
      case 2:
        return "tue".toUpperCase();
      case 3:
        return "wed".toUpperCase();
      case 4:
        return "thu".toUpperCase();
      case 5:
        return "fri".toUpperCase();
      case 6:
        return "sat".toUpperCase();
    }
    return null;
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
    var itemsLength = ref.watch(consultantAvailabilityProvider
        .select((value) => value.firstWhere((element) => element.dayOfWeek == parentIndex, orElse: () => ConsultantAvailabilityEntity()).time?.length ?? 0));
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Column(
            children: List.generate(
              itemsLength,
              (index) => FittedBox(
                child: Row(
                  children: [
                    TimeSelectionView(
                        initialTime: parseTimeOfDay(ref.watch(consultantAvailabilityProvider
                            .select((value) => value.firstWhere((element) => element.dayOfWeek == parentIndex).time?.elementAt(index).from ?? ""))),
                        onTimeSelected: (time) {
                          ref.read(consultantAvailabilityProvider.notifier).updateDateFrom(parentIndex, index, time);
                        }),
                    const SizedBox(width: 15),
                    TimeSelectionView(
                        initialTime: parseTimeOfDay(ref.watch(consultantAvailabilityProvider
                            .select((value) => value.firstWhere((element) => element.dayOfWeek == parentIndex).time?.elementAt(index).to ?? ""))),
                        onTimeSelected: (time) {
                          ref.read(consultantAvailabilityProvider.notifier).updateDateTo(parentIndex, index, time);
                        }),
                    const SizedBox(width: 10),
                    GestureDetector(
                        onTap: () {
                          ref.read(consultantAvailabilityProvider.notifier).remove(parentIndex, index);
                        },
                        child: const Icon(Icons.close_rounded, color: CustomColor.ratingRed)),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(onTap: () => ref.read(consultantAvailabilityProvider.notifier).addSlot(parentIndex), child: const Icon(Icons.add, color: CustomColor.darkPurple)),
      ],
    );
  }
}
