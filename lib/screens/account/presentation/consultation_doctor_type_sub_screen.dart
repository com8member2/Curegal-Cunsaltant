import 'dart:developer';

import 'package:consultation_curegal/consatant/ColorConstant.dart';
import 'package:consultation_curegal/consatant/Constants.dart';
import 'package:consultation_curegal/routing/app_routes.dart';
import 'package:consultation_curegal/screens/account/controller/consultation_category_controller.dart';
import 'package:consultation_curegal/shared/widget/custom_chip_widget.dart';
import 'package:consultation_curegal/shared/widget/shared_small_widgets.dart';
import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/widget/common_bottom_align.dart';
import '../../../shared/widget/custom_button.dart';
import '../../../shared/widget/custom_chip_widget.dart';
import '../../../shared/widget/shared_small_widgets.dart';


import '../../../shared/widget/common_bottom_align.dart';
import '../../../shared/widget/custom_button.dart';
import '../repository/consultation_category_repository.dart';

class DoctorConsultantSubType extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var personType = ModalRoute.of(context)?.settings.arguments as int;

    var consultation_id = (0);

    useEffect(() {
      ref.read(categoryProvider.notifier).getData(personType);
    }, []);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBarH("heading", context),
      body: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.only(bottom: 120, left: 15, right: 15),
            itemCount: ref.watch(categoryProvider.select((value) => value.length)),
            itemBuilder: (context, index) {
              return _ItemView(index);
            },
          ),
          Positioned(
              child: Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: CommonBottomAlignWidget(
                    setBottomWidget: CustomButton(CustomColor.white, CustomColor.primaryPurple, tr(context).submit, () async {
                      try {
                        EasyLoading.show();
                        await ref.watch(consultationCategoryRepositoryProvider).addConsultationCategory(ref,personType);
                        Navigator.popUntil(context, (route) => route.settings.name== AppRoutes.homeScreen);
                        EasyLoading.dismiss();
                      } on Exception catch (e) {
                        log(e.toString());
                        EasyLoading.dismiss();
                        EasyLoading.showError(e.toString());
                      }
                    }, 10, 1, MediaQuery.of(context).size.width),
                  ))),
        ],
      ),
    );
  }
}

class _ItemView extends HookConsumerWidget {
  final int index;

  const _ItemView(
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(categoryProvider.select((value) => value.elementAt(index)));
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CardListViewDesign(
            onClick: () {
              ref.read(categoryProvider.notifier).updateData(index, !(data.isSelected ?? false));
            },
            customWidget: Row(
              children: [
                Checkbox(
                  activeColor: CustomColor.primaryPurple,
                  checkColor: CustomColor.white,
                  value: ref.watch(categoryProvider.select((value) => value.elementAt(index).isSelected ?? false)),
                  onChanged: (value) {
                    ref.read(categoryProvider.notifier).updateData(index, value ?? false);
                  },
                ),
                const SizedBox(width: 10),
                Text(
                  data.name.toString(),
                  style: commonTextStyle(context, 16),
                ),
              ],
            ),
          ),
          if (ref.watch(categoryProvider.select((value) => value.elementAt(index).isSelected ?? false)))
            ref.watch(categoryProvider.select((value) => value.elementAt(index).data?.length ?? 0)) != 0 ?Wrap(
              spacing: 0,
              children: List<Widget>.generate(
                ref.watch(categoryProvider.select((value) => value.elementAt(index).data?.length ?? 0)),
                (subIndex) {
                  return SubItem(index, subIndex);
                },
              ),
            ) : const Text("No Categories available")
        ],
      ),
    );
  }
}

class SubItem extends HookConsumerWidget {
  final int index;
  final int subIndex;

  const SubItem(
    this.index,
    this.subIndex, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var item = ref.watch(categoryProvider.select((value) => value.elementAt(index).data![subIndex]));
    return Padding(
      padding: const EdgeInsets.all(2),
      child: CustomChipWidget(
        item.name.toString(),
        ref.watch(subItemSelectedProvider.select((value) => value.contains(item))),
        (value) {
          if (value) {
            ref.read(subItemSelectedProvider.notifier).add(item);
          } else {
            ref.read(subItemSelectedProvider.notifier).remove(item);
          }
        },
      ),
    );
  }
}
