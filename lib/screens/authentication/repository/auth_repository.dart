
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../../../consatant/Constants.dart';
import '../../../utility/utility.dart';

final authRepositoryProvider = Provider((_) => AuthRepository());

class AuthRepository {

  checkUser(String phoneNumber) async => await Constants.supabaseClient.rpc('checkconsultant', params: {'phone': phoneNumber});

  signInWithOtp(String phoneNumber) => Constants.supabaseClient.auth.signInWithOtp(phone: phoneNumber);

  Future< AuthResponse> verifyOtp(String otpValue, String phoneNumber) => Constants.supabaseClient.auth.verifyOTP(token: otpValue, type: OtpType.sms, phone: phoneNumber);

   Future<List> getConsultantAuthID() async {
   return await Constants.supabaseClient.from('consultant_profile').select()
        .eq('supabase_auth_id',Constants.supabaseClient.auth.currentSession?.user.id);
  }

  PostgrestFilterBuilder<dynamic> registerUser(Map map) => Constants.supabaseClient.from('consultant_profile').insert(map);
}