import 'dart:async';

import 'package:get/get.dart';

class OtpVerificationController extends GetxController{
  Timer? timer;
  int secondsRemaining = 120;
  bool enableResend = false;

  void timerCode(){
    timer=Timer.periodic(const Duration(seconds: 1), (_) {
      if(secondsRemaining!=0){
        secondsRemaining--;
        update();
      }else{
        enableResend=true;
        update();
      }
    });
  }

  void resendCode() {
    //other code here
    secondsRemaining = 120;
    enableResend = false;
    update();
  }
}