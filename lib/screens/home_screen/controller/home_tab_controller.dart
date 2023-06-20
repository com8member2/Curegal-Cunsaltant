import 'package:consultation_curegal/consatant/Constants.dart';
import 'package:consultation_curegal/shared/controller/user_profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_tab_controller.g.dart';

@riverpod
Future<List> allBookings(AllBookingsRef ref) async {
  return await Constants.supabaseClient.from(SupaTables.booking).select('*,user_profile(*)').gte("date", DateTime.now()).eq("consultant_id", ref.read(userProfileProvider).id);
}
