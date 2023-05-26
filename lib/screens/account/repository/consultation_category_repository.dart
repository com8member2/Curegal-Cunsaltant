import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../../../consatant/Constants.dart';

final consultationCategoryRepositoryProvider = Provider((_) => ConsultationCategoryRepository());

class ConsultationCategoryRepository {
  Future<PostgrestResponse> getConsultationCategory(int id) => Constants.supabaseClient
      .from('consultation_category')
      .select()
      .eq('consultant_persons_id', id)
      .is_('image', null)
      .execute();
}
