
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../../../consatant/Constants.dart';
import '../../../utility/utility.dart';
part 'consultant_profile_repository.g.dart';


@riverpod
profileRepository(ProfileRepositoryRef) => ProfileRepository();

class ProfileRepository {

  PostgrestFilterBuilder<dynamic> addConsultant(Map map) => Constants.supabaseClient.from('consultant_profile').insert(map);

  Future<PostgrestResponse> getConsultantProfile() async => Constants.supabaseClient.from(SupaTables.consultantProfile).select().eq('id', (await getSharedPreference()).getString(PrefsKeys.consultantID)).execute();
}