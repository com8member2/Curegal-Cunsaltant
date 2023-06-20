import 'dart:developer';
import 'package:consultation_curegal/screens/consultant_availability/controller/overridden_list_controller.dart';
import 'package:consultation_curegal/shared/controller/user_profile.dart';
import 'package:flutter/src/material/time.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../consatant/Constants.dart';
import '../../../utility/utility.dart';
import '../model/consultat_availability_entity.dart';
import '../repository/consultant_availability_repository.dart';

part 'consultant_availability_controller.g.dart';

@riverpod
class slotTime extends _$slotTime {
  String? _initData;

  @override
  String? build() {
    getData();
    return null;
  }

  getData() async {
    var res = await Constants.supabaseClient.from(SupaTables.consultantProfile).select('consultation_duration').eq("id", ref.read(userProfileProvider).id).single();
    state = res["consultation_duration"].toString();
    _initData = state;
  }

  isChanged() => _initData != state;
}

@riverpod
class slotPrice extends _$slotPrice {
  String? _initData;

  @override
  String? build() {
    getData();
    return null;
  }

  getData() async {
    var res = await Constants.supabaseClient.from(SupaTables.consultantProfile).select('consultation_price').eq("id", ref.read(userProfileProvider).id).single();
    state = res["consultation_price"].toString();
    _initData = state;
  }

  isChanged() => _initData != state;
}

@riverpod
class ConsultantAvailability extends _$ConsultantAvailability {
  List<ConsultantAvailabilityEntity> _initData = [];

  @override
  List<ConsultantAvailabilityEntity> build() {
    getData();
    return [];
  }

  Future<void> getData() async {
    await ref.watch(consultantAvailabilityRepositoryProvider).getAvailabilityData().then((res) {
      List<ConsultantAvailabilityEntity> lists = [];
      res.forEach((key, value) {
        var day = getDayOfWeekIndex(key);
        if (day is int) {
          if (value is List) {
            lists.add(ConsultantAvailabilityEntity().copyWith(
                dayOfWeek: day,
                time: value.map((e) => ConsultatAvailabilityTime.fromJson(e)).toList(),
                id: (res["id"]),
                slotPrice: double.parse(res["slot_price"].toString()),
                slotTime: double.parse(res["slot_time"].toString())));
          }
        }
      });
      state = lists;
      _initData = lists;
    }).onError((error, stackTrace) {
      EasyLoading.showError(error.toString());
      log(error.toString());
    });
  }

  addSlot(int parentIndex) {
    state = state.any((element) => element.dayOfWeek == parentIndex)
        ? state.map((element) {
            if (element.dayOfWeek == parentIndex) {
              element.time = [...?element.time, ConsultatAvailabilityTime().copyWith(from: "09:00:00", to: "18:00:00")];
            }
            return element;
          }).toList()
        : [
            ...state,
            ConsultantAvailabilityEntity().copyWith(dayOfWeek: parentIndex, time: [ConsultatAvailabilityTime().copyWith(from: "09:00:00", to: "18:00:00")])
          ];
  }

  remove(int parentIndex, int index) {
    var i = state.indexWhere((element) => element.dayOfWeek == parentIndex);
    var item = state.elementAt(i).time;
    if (item?.length == 1) {
      state.removeAt(i);
      state = [...state];
    } else {
      item?.removeAt(index);
      state[i].time = item;
      state = [...state];
    }
  }

  void removeAll(ConsultantAvailabilityEntity index) {
    var i = state.indexOf(index);
    state.removeAt(i);
    state = [...state];
  }

  void updateDateFrom(int parentIndex, int index, TimeOfDay time) {
    state = state.map((e) {
      if (e.dayOfWeek == parentIndex) {
        e.time?[index] = e.time![index].copyWith(from: "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00");
      }
      return e;
    }).toList();
  }

  void updateDateTo(int parentIndex, int index, TimeOfDay time) {
    state = state.map((e) {
      if (e.dayOfWeek == parentIndex) {
        e.time?[index] = e.time![index].copyWith(to: "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00");
      }
      return e;
    }).toList();
  }

  Future<void> saveChanges(String price, String time) async {
    if (EasyLoading.isShow) return;
    if (state.isEmpty) {
      await EasyLoading.showInfo("Please select days for your availability.");
    } else {
      await EasyLoading.show();
      try {
        if ((ref.read(overriddenListControllerProvider.notifier).isNotChanged()) &&
            (price == ref.read(slotPriceProvider) && time == ref.read(slotTimeProvider)) &&
            _initData == state) {
          EasyLoading.showInfo("No changes to be saved.");
          return;
        } else {
          if (!(ref.read(overriddenListControllerProvider.notifier).isNotChanged())) {
            await ref.read(overriddenListControllerProvider.notifier).saveChanged();
          }
          if (!(price == ref.read(slotPriceProvider) && time == ref.read(slotTimeProvider))) {
            await updateTimeOrPrice(price, time);
          }
          if (!(_initData == state)) {
            Map map = {
              "consultant_id": (await getSharedPreference()).getString(PrefsKeys.consultantID),
              if (state.first.id != null) "id": state.first.id,
            };

            for (var element in state) {
              if(element.time?.any((element) => element.from.toString().tosupaTime().isAfter(element.to.toString().tosupaTime()))??false){
                EasyLoading.showToast("Select proper time range for all week days to continue further.");
                return;
              }
              map.addAll({getDayOfWeek(element.dayOfWeek): element.time?.map((e) => e.toJson()).toList()});
            }
            await ref.read(consultantAvailabilityRepositoryProvider).setAvailableTime(map);
            _initData = state;
            getData();
            EasyLoading.showSuccess("Saved successfully.");
          }
        }

      } on Exception catch (e) {
        log(e.toString());
        EasyLoading.showError(e.toString());
      }
    }
  }

  getDayOfWeek(int? dayOfWeek) {
    switch (dayOfWeek) {
      case 0:
        return "sun";
      case 1:
        return "mon";
      case 2:
        return "tue";
      case 3:
        return "wed";
      case 4:
        return "thu";
      case 5:
        return "fri";
      case 6:
        return "sat";
    }
  }

  getDayOfWeekIndex(String? dayOfWeek) {
    switch (dayOfWeek) {
      case "sun":
        return 0;
      case "mon":
        return 1;
      case "tue":
        return 2;
      case "wed":
        return 3;
      case "thu":
        return 4;
      case "fri":
        return 5;
      case "sat":
        return 6;
    }
  }

  updateTimeOrPrice(String price, String time) async {
    await Constants.supabaseClient
        .from(SupaTables.consultantProfile)
        .update({"consultation_price": price, "consultation_duration": time}).eq("id", ref.read(userProfileProvider).id);
    ref.read(slotTimeProvider.notifier).state = time;
    ref.read(slotPriceProvider.notifier).state = price;
    EasyLoading.showSuccess("Saved successfully.");
  }
}
