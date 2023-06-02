import 'dart:developer';

import 'package:consultation_curegal/screens/account/model/consultation_category_entity.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repository/consultation_category_repository.dart';

part 'consultation_category_controller.g.dart';

@riverpod
class Category extends _$Category {
  @override
  List<ConsultationCategoryEntity> build() {
    return [];
  }

  getData(int personType) async {
    EasyLoading.show();
    try {
      List<ConsultationCategoryEntity> list2 = await ref.watch(consultationCategoryRepositoryProvider).getCategories(personType);
      state = list2;
      EasyLoading.dismiss();
    } on Exception catch (e) {
      log(e.toString());
      EasyLoading.dismiss();
      EasyLoading.showError(e.toString());
    }
  }



  void updateData(int index, bool value) {
    var list = state;
    state[index].isSelected = value;
    state = [...list];
  }
}

@riverpod
class SubItemSelected extends _$SubItemSelected {
  @override
  List<ConsultationCategoryConsultationSubCategories> build() => [];

  add(dynamic item) {
    state = [item, ...state];
    log(state.length.toString());
    ref.keepAlive();
  }

  remove(dynamic item) {
    state.remove(item);
    state = [...state];
  }

  void reset() {
    state = [];
  }
}
