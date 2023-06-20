import 'dart:developer';

import 'package:consultation_curegal/consatant/Constants.dart';
import 'package:consultation_curegal/screens/consultant_availability/controller/overridden_list_controller.dart';
import 'package:consultation_curegal/screens/consultant_availability/repository/consultant_availability_repository.dart';
import 'package:consultation_curegal/shared/controller/user_profile.dart';
import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/time.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:intl/intl.dart';

import '../model/availability_override_entity.dart';

part 'availability_override_controller.g.dart';

@riverpod
class AvailabilityOverrideController extends _$AvailabilityOverrideController {
  @override
  AvailabilityOverrideEntity build() {
    return AvailabilityOverrideEntity();
  }

  void addSlot() {
    state = state.copyWith(time: [...?state.time, AvailabilityOverrideTime().copyWith(from: "09:00:00", to: "18:00:00")]);
  }

  void removeAll() {
    state = state.copyWith(time: []);
  }

  void remove(int index) {
    var timeList = state.time;
    timeList?.removeAt(index);
    state = state.copyWith(time: timeList);
  }

  void updateDateFrom(int index, TimeOfDay time) {
    var timeList = state.time;
    timeList?[index].from = "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00";
    state = state.copyWith(time: timeList);
  }

  void updateDateTo(int index, TimeOfDay time) {
    var timeList = state.time;
    timeList?[index].to = "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00";
    state = state.copyWith(time: timeList);
  }

  addOverriddenData(BuildContext context, List<DateTime> dateList) async {
    if (dateList.isEmpty) {
      EasyLoading.showInfo("Please select date to override.");
      return;
    }
    await EasyLoading.show();
    try {
      state.consultantId = ref.read(userProfileProvider).id;
      state.available = state.time?.isNotEmpty ?? false;
      if(state.time?.any((element) => element.from.toString().tosupaTime().isAfter(element.to.toString().tosupaTime()))??false){
        EasyLoading.showToast("Select proper time range.");
        return;
      }
      var list = List.generate(dateList.length, (index) {
        var map = state.toJson();
        map.remove("id");
        map["date"] = dateList.elementAt(index).toSupaFormate();
        return map;
      });
      await ref.read(consultantAvailabilityRepositoryProvider).addOverriddenDate(list)
          .then((value) {
            ref.read(overriddenListControllerProvider.notifier).getData();
            Navigator.pop(context);
          });
      EasyLoading.showSuccess("Success");
    } on Exception catch (e) {
      log(e.toString());
      EasyLoading.showError(e.toString());
    }
  }
}
