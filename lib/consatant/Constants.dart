import 'package:supabase_flutter/supabase_flutter.dart';

class Constants{
  static var supabaseClient = Supabase.instance.client;
  static  bool isNewUser = false;
  static bool isForgotPassword = false;
  static String phoneNumber = "";
  static String authKey = "";
}

class PrefsKeys {
  static String isLogin = "isLogin";
  static String consultantID = "consultantID";
  static String phoneNumber = "phoneNumber";
}

class SupaTables{
  static String consultantProfile ="consultant_profile";
}