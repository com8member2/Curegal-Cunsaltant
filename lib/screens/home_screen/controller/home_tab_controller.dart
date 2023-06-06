import 'dart:developer';
import 'package:consultation_curegal/shared/controller/user_profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/consultat_availability_entity.dart';

part 'home_tab_controller.g.dart';

@riverpod
class ConsultantAvailability extends _$ConsultantAvailability {
  @override
  List<ConsultantAvailabilityEntity> build() {
    return [];
  }

  addSlot(int parentIndex) {
    state = state.any((element) => element.dayOfWeek == parentIndex)
        ? state.map((element) {
            if (element.dayOfWeek == parentIndex) {
              element.time = [...?element.time, ConsultatAvailabilityTime().copyWith(from: "09:00:00",to: "18:00:00")];
            }
            return element;
          }).toList()
        : [
            ...state,
            ConsultantAvailabilityEntity().copyWith(dayOfWeek: parentIndex, time: [ConsultatAvailabilityTime().copyWith(from: "09:00:00",to: "18:00:00")])
          ];
    log(state.toString());
  }

  remove(int parentIndex, int index) {
    state = state.map((element) {
      if(element.dayOfWeek==parentIndex){
        var time = element.time;
        time?.removeAt(index);
        element.time = time;
      }
      return element;
    }).toList();
  }

  void removeAll(ConsultantAvailabilityEntity index) {
    var i = state.indexOf(index);
    state.elementAt(i).time = null;
    state = [...state];
  }
}
