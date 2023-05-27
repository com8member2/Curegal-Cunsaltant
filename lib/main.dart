import 'package:consultation_curegal/routing/app_routes.dart';
import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: "https://vjbzoymwstifxmeywnxn.supabase.co",
      anonKey:
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZqYnpveW13c3RpZnhtZXl3bnhuIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODM5MDA4MzQsImV4cCI6MTk5OTQ3NjgzNH0.EXVLBfXdNYzRtz8JfjO9hIFnaGTqiPZ_xfSZZ6JHsSs");

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(builder: (context, child) {
        return ScrollConfiguration(behavior: MyBehavior(), child: child ?? SizedBox());
      }),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: AppRoutes.loginScreen,
      routes: AppRoutes.routes,
    );
  }
}
