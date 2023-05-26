
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../../../consatant/Constants.dart';

final profileRepositoryProvider = Provider((_) => ProfileRepository());

class ProfileRepository {

  PostgrestFilterBuilder<dynamic> addConsultant(Map map) => Constants.supabaseClient.from('consultant_profile').insert(map);
}