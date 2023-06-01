import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../consatant/ColorConstant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

SharedPreferences? pref;

Future<SharedPreferences> getSharedPreference() async {
  return pref ??= await SharedPreferences.getInstance();
}

class NoGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

AppLocalizations tr(BuildContext context) => AppLocalizations.of(context)!;

BoxDecoration shadow(BuildContext context, [Color? scaffoldBackgroundColor]) {
  return BoxDecoration(
    color: CustomColor.white,
    boxShadow: [BoxShadow(spreadRadius: 1, blurRadius: 10, color: CustomColor.black.withOpacity(0.5), offset: const Offset(0, 0))],
  );
}

TextStyle commonTextStyle(BuildContext context, double fontSize, [FontWeight? fontweight, Color? color]) {
  return TextStyle(fontWeight: fontweight == null ? FontWeight.w500 : fontweight, letterSpacing: 1, color: color == null ? CustomColor.black : color, fontSize: fontSize);
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

Future<PostgrestResponse<dynamic>> readData(String tableName,[String columnName="*"]) async {
  PostgrestResponse<dynamic> res = await Supabase.instance.client
      .from(tableName)
      .select(columnName)
      .execute();
  return res;



}
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /*/// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';*/
}
