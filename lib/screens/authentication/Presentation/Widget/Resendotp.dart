import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../consatant/ColorConstant.dart';
import '../../../../consatant/Constants.dart';
import '../../../../utility/utility.dart';


class ResendOTPTimerWidget extends HookWidget {

  final String phoneNumber;

  const ResendOTPTimerWidget({ required this.phoneNumber});

  @override
  Widget build(BuildContext context) {

    final timerDuration = Duration(seconds: 10);
    final isTimerActive = useState(true);
    final timeRemaining = useState(timerDuration);

    useEffect(() {
      final timer = Timer.periodic(Duration(seconds: 1), (_) {
        if (timeRemaining.value.inSeconds == 0) {
          isTimerActive.value = false;
        } else {
          timeRemaining.value = timeRemaining.value - Duration(seconds: 1);
        }
      });
      return timer.cancel;
    }, []);

    final remainingTimeFormatted = useMemoized(() {
      final remainingSeconds = timeRemaining.value.inSeconds % 60;
      final remainingMinutes = timeRemaining.value.inMinutes;
      final formattedSeconds =
      remainingSeconds < 10 ? '0$remainingSeconds' : '$remainingSeconds';
      final formattedMinutes =
      remainingMinutes < 10 ? '0$remainingMinutes' : '$remainingMinutes';
      return '$formattedMinutes:$formattedSeconds';
    }, [timeRemaining.value]);

    return Row(
      children: [
        GestureDetector(onTap: () async {
          if(!isTimerActive.value){
            await Constants.supabaseClient.auth.signInWithOtp(phone: phoneNumber).then((value) {
              isTimerActive.value = true;
            },);
          }
        },child: Text(tr(context).resend_otp,style: TextStyle(color: !isTimerActive.value ?CustomColor.rxtBlue:CustomColor.txtGray,fontSize: 18,decoration: TextDecoration.underline))),
        Spacer(),
        Text("${remainingTimeFormatted}",style: TextStyle(fontSize: 18),),
       // if (!isTimerActive.value)
      ],
    );
  }
}
