import 'package:consultation_curegal/shared/controller/user_profile.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'consultant_profile_controller.g.dart';

@riverpod
class GetConsultantProfile extends _$GetConsultantProfile {
  @override
  Future<List<dynamic>> build() async {
    EasyLoading.show();
    var user = await ref.watch(userProfileProvider.notifier).getUserData();
    EasyLoading.dismiss();
    return [user.toJson()];
}

  void refesh(value) {
    state = AsyncValue.data([value]);
  }
}




