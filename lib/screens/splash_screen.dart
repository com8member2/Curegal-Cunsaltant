
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../consatant/ColorConstant.dart';
import '../consatant/Constants.dart';
import '../utility/utility.dart';

import 'authentication/Presentation/login_screen.dart';
import 'home_screen/presentation/home_screen.dart';



class SplashScreen extends HookWidget {

  @override
  Widget build(BuildContext context) {


    useEffect(() {
      Future.delayed(Duration(seconds:3), ()  {

        final User? user = Constants.supabaseClient.auth.currentUser;
        if(user?.id != null){
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeScreen()),);
        }
        else{
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginScreen()),);
        }
      });
    },);

    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: Material(
        type: MaterialType.transparency,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          child: Container(
            decoration: const BoxDecoration(color: CustomColor.primaryPurple),
            child: Center(
              child: Text(
                tr(context).curegal,
                style: TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold,fontFamily: "productsun"),
              ),
            ),
          ),
        ),
      ),
    );
  }


}
