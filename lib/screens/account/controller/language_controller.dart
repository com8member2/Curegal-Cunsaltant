import 'package:consultation_curegal/screens/account/repository/account_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'language_controller.g.dart';

@riverpod
class Languages extends _$Languages {
  @override
  Future<List> build() async {
  return await ref.watch(accountRepositoryProvider).getAllLanguages();
}

  void toggleCheckbox(data, int index) {
    var list = state.value;
    list?.elementAt(index)["isSelected"] = !(list.elementAt(index)["isSelected"]??false);
    if(list != null)
    state = AsyncValue.data(list);
  }
  Future<void> selectLanguages(WidgetRef ref, BuildContext context) async {
    await ref.watch(accountRepositoryProvider).selectLanguages(ref, context);
  }
}
