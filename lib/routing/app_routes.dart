import 'package:flutter/cupertino.dart';
import '../screens/account/presentation/account_setting.dart';
import '../screens/account/presentation/consultation_doctor_type_sub_screen.dart';
import '../screens/account/presentation/exeperience_education.dart';
import '../screens/account/presentation/language_selection_screen.dart';
import '../screens/account/presentation/consultant_profile.dart';

import '../screens/authentication/Presentation/login_screen.dart';

import '../screens/authentication/Presentation/send_otp.dart';
import '../screens/account/presentation/consultation_type.dart';
import '../screens/account/presentation/document_upload.dart';
import '../screens/account/presentation/document_verification.dart';
import '../screens/home_screen/presentation/home_screen.dart';
import '../screens/splash_screen.dart';

class AppRoutes {
  static const homeScreen = "homeScreen";
  static const consultationCategory = "consultationCategory";
  static const consultationDoctorsList = "consultationDoctorsLIst";
  static const consultationAppointmentScreen = "consultationAppointmentScreen";
  static const consultationChatScreen = "consultationChatScreen";
  static const chatsummaryScreen = "chat_summary";
  static const chatWithConsultantScreen = "chat_with_consultant";
  static const splashScreen = "splash_screen";
  static const loginScreen = "login_screen";
  static const sendOtpScreen = "send_otp";
  static const consultationTypeScreen = "consultation_type";
  static const documentsVerifyScreen = "document_verification";
  static const consultationProfileScreen = "consultant_profile";
  static const accountSettingsScreen = "account_setting";
  static const educationnExperienceScreen = "exeperience_education";
  static const languageSelectScreen = "language_selection_screen";
  static const documentUploadScreen = "document_upload";
  static const doctorConsultationSubTypeScreen = "consultation_doctor_type_sub_screen";

  static Map<String, Widget Function(BuildContext)> routes = {
    homeScreen: (p0) => const HomeScreen(),
    splashScreen: (p0) => SplashScreen(),
    loginScreen: (p0) => LoginScreen(),
    sendOtpScreen: (p0) => SendOTP(),
    consultationTypeScreen: (p0) => ConsultationType(),
    documentsVerifyScreen: (p0) => DocumentsVerificationScreen(),
    consultationProfileScreen: (p0) => ConsultationProfile(),
    accountSettingsScreen: (p0) => AccountSettingsScreen(),
    educationnExperienceScreen: (p0) => EducationnExperience(),
    languageSelectScreen: (p0) => LanguageSelect(),
    documentUploadScreen: (p0) => DocumentUploadScreen(),
    doctorConsultationSubTypeScreen: (p0) => DoctorConsultantSubType(),

  };
}
