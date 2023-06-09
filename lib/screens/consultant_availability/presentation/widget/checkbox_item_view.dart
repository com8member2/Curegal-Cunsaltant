import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../consatant/ColorConstant.dart';
import '../../../../shared/widget/shared_small_widgets.dart';
import '../../../../utility/utility.dart';
import '../../model/availability_override_entity.dart';

class CheckBoxView extends HookConsumerWidget {
  final AvailabilityOverrideEntity item;
  final VoidCallback add;
  final Function(int index) remove;
  final VoidCallback removeAll;
  final Function(int index, TimeOfDay time) onFromTimeSelected;
  final Function(int index, TimeOfDay time) onToTimeSelected;

  const CheckBoxView(
    this.item, {
    required this.add,
    required this.remove,
    required this.removeAll,
    required this.onFromTimeSelected,
    required this.onToTimeSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        if (!(item.time?.isNotEmpty ?? false)) {
          add();
        } else {
          removeAll();
        }
      },
      child: Row(
        children: [
          Checkbox(
            activeColor: CustomColor.darkPurple,
            value: item.time?.isNotEmpty ?? false,
            onChanged: (bool? value) {
              if (!(item.time?.isNotEmpty ?? false)) {
                add();
              } else {
                removeAll();
              }
            },
          ),
          if (item.date != null) Text(item.date.toString()),
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Column(
                          children: List.generate(
                            item.time?.length ?? 0,
                            (index) => FittedBox(
                              child: Row(
                                children: [
                                  TimeSelectionView(
                                      initialTime: parseTimeOfDay(item.time?.elementAt(index).from ?? ""),
                                      onTimeSelected: (time) {
                                        onFromTimeSelected(index, time);
                                      }),
                                  const SizedBox(width: 15),
                                  TimeSelectionView(
                                      initialTime: parseTimeOfDay(item.time?.elementAt(index).to ?? ""),
                                      onTimeSelected: (time) {
                                        onToTimeSelected(index, time);
                                      }),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                      onTap: () {
                                        remove(index);
                                      },
                                      child: const Icon(Icons.close_rounded, color: CustomColor.ratingRed)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(onTap: add, child: const Icon(Icons.add, color: CustomColor.darkPurple)),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
