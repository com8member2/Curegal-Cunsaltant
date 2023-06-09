import 'dart:developer';

import 'package:consultation_curegal/consatant/Constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utility/utility.dart';

final consultantAvailabilityRepositoryProvider = Provider.autoDispose((ref) => ConsultantAvailabilityRepository());

class ConsultantAvailabilityRepository {
  setAvailableTime(Map<dynamic, dynamic> map) async {
    await Constants.supabaseClient
        .from(SupaTables.consultantAvailability)
        .delete()
        .match({"consultant_id": (await getSharedPreference()).getString(PrefsKeys.consultantID)});
    await Constants.supabaseClient.from(SupaTables.consultantAvailability).insert(map).select();
  }

  Future<Map> getAvailabilityData() async {
    Map res = await Constants.supabaseClient
        .from(SupaTables.consultantAvailability)
        .select()
        .eq("consultant_id", (await getSharedPreference()).getString(PrefsKeys.consultantID))
        .single();
    return res;
  }

  Future<List> getOverriddenData() async {
    List res = await Constants.supabaseClient
        .from(SupaTables.consultantAvailabilityOverride)
        .select()
        .eq("consultant_id", (await getSharedPreference()).getString(PrefsKeys.consultantID));
    return res;
  }

  Future<void> addOverriddenDate(List<Map<String, dynamic>> list) async {
    await Constants.supabaseClient.from(SupaTables.consultantAvailabilityOverride).insert(list);
  }

  Future<List> updateOverridden(List<Map<String, dynamic>> list) async {
    return await Constants.supabaseClient.from(SupaTables.consultantAvailabilityOverride).upsert(list).select();
  }
}
