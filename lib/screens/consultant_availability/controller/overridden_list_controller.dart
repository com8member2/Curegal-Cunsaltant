import 'dart:developer';

import 'package:consultation_curegal/screens/consultant_availability/model/availability_override_entity.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/consultant_availability_repository.dart';

part 'overridden_list_controller.g.dart';

@riverpod
class OverriddenListController extends _$OverriddenListController {
  List<AvailabilityOverrideEntity> _initData = [];
  @override
  List<AvailabilityOverrideEntity> build() {
    getData();
    return [];
  }

  getData() async {
    await ref.watch(consultantAvailabilityRepositoryProvider).getOverriddenData().then((value) {
      state = value.map((e) => AvailabilityOverrideEntity.fromJson(e)).toList();
      _initData = state;
    });
  }

  addSlot(int index) {
    if (state.length > index) {
      state.elementAt(index).time = [...?state.elementAt(index).time, AvailabilityOverrideTime().copyWith(to: "18:00:00", from: "06:00:00")];
      state = [...state];
    }
  }

  remove(int parentIndex, int index) {
    state.elementAt(parentIndex).time?.removeAt(index);
    state = [...state];
  }

  void removeAll(int index) {
    state.elementAt(index).time = null;
    state = [...state];
  }

  void updateDateFrom(int parentIndex, int index, TimeOfDay time) {
    state.elementAt(parentIndex).time?.elementAt(index).from = "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00";
    state = [...state];
  }

  void updateDateTo(int parentIndex, int index, TimeOfDay time) {
    state.elementAt(parentIndex).time?.elementAt(index).to = "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00";
    state = [...state];
  }

  saveChanged() async {
    if(isNotChanged()) return;
    await ref.read(consultantAvailabilityRepositoryProvider).updateOverridden(state.map((e) {
      e.available = e.time?.isNotEmpty??false;
      return e.toJson();
    }).toList());
    _initData = state;
  }

  bool isNotChanged() => _initData == state;
}
