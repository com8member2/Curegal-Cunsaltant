import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../consatant/ColorConstant.dart';
import '../../../../consatant/Constants.dart';
import '../../../../utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ResendOTPTimerWidget extends HookWidget {

  final String phoneNumber;
  const ResendOTPTimerWidget({ required this.phoneNumber});
  @override
  Widget build(BuildContext context) {

    final timerValue = useState(10);
    final timerRunning = useState(false);

    void startTimer() {
      if (!timerRunning.value) {
        timerRunning.value = true;
        timerValue.value = 10;

        Timer.periodic(Duration(seconds: 1), (Timer timer) {
          if (timerValue.value > 0) {
            timerValue.value--;
          } else {
            timer.cancel();
            timerRunning.value = false;
          }
        });
      }
    }

    useEffect(() {
      startTimer();
      return () {
        // Cleanup function
      };
    }, []);


    String formatTime(int time) {
      final minutes = (time ~/ 60).toString().padLeft(2, '0');
      final seconds = (time % 60).toString().padLeft(2, '0');
      return '$minutes:$seconds';
    }

    return Center(
      child: GestureDetector(
          onTap: () async {
            if(timerValue.value == 0){
              startTimer();
              await Constants.supabaseClient.auth.signInWithOtp(phone: phoneNumber);
            }
          },
          child: Row(children: [
            AnimatedDefaultTextStyle(
              style: TextStyle(
                  color: timerValue.value == 0 ?  CustomColor.rxtBlue : CustomColor.txtGray,
                  decoration: TextDecoration.underline
                  ,fontSize: 16
              ),
              duration: const Duration(milliseconds: 200),
              child:  Text(
                tr(context).resend_otp,
              ),
            ),
            Spacer(),
            AnimatedDefaultTextStyle(
              style: TextStyle(
                  color: timerValue.value == 0 ?  CustomColor.rxtBlue : CustomColor.txtGray,
                  fontSize: 16
              ),
              duration: const Duration(milliseconds: 200),
              child: Text(
                '${formatTime(timerValue.value)}',
              ),
            ),
          ],)
         ),
    );
  }
}

// class ResendOTPTimerWidget extends HookWidget {
//
//   final String phoneNumber;
//
//   const ResendOTPTimerWidget({ required this.phoneNumber});
//
//   @override
//   Widget build(BuildContext context) {
//
//     final timerDuration = Duration(seconds: 10);
//     final isTimerActive = useState(true);
//     final timeRemaining = useState(timerDuration);
//
//     useEffect(() {
//       final timer = Timer.periodic(Duration(seconds: 1), (_) {
//         if (timeRemaining.value.inSeconds == 0) {
//           isTimerActive.value = false;
//         } else {
//           timeRemaining.value = timeRemaining.value - Duration(seconds: 1);
//         }
//       });
//       return timer.cancel;
//     }, []);
//
//     final remainingTimeFormatted = useMemoized(() {
//       final remainingSeconds = timeRemaining.value.inSeconds % 60;
//       final remainingMinutes = timeRemaining.value.inMinutes;
//       final formattedSeconds =
//       remainingSeconds < 10 ? '0$remainingSeconds' : '$remainingSeconds';
//       final formattedMinutes =
//       remainingMinutes < 10 ? '0$remainingMinutes' : '$remainingMinutes';
//       return '$formattedMinutes:$formattedSeconds';
//     }, [timeRemaining.value]);
//
//     return Row(
//       children: [
//         GestureDetector(onTap: () async {
//           if(!isTimerActive.value){
//             await Constants.supabaseClient.auth.signInWithOtp(phone: phoneNumber).then((value) {
//               isTimerActive.value = true;
//             },);
//           }
//         },child: Text(tr(context).resend_otp,style: TextStyle(color: !isTimerActive.value ?CustomColor.rxtBlue:CustomColor.txtGray,fontSize: 18,decoration: TextDecoration.underline))),
//         Spacer(),
//         Text("${remainingTimeFormatted}",style: TextStyle(fontSize: 18),),
//        // if (!isTimerActive.value)
//       ],
//     );
//   }
// }
