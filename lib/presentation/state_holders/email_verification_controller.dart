import 'dart:async';

import 'package:ecommerce_crafty_bay/data/models/network_response.dart';
import 'package:ecommerce_crafty_bay/data/utility/network_caller.dart';
import 'package:ecommerce_crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController{
  bool _emailVerificationInProgress= false;
  String _message='';
  bool get emailVerificationInProgress => _emailVerificationInProgress;
  String get message=>_message;

  Future<bool> verifyEmail (String email)async{
    _emailVerificationInProgress=true;
    update();
    final NetworkResponse response=await NetworkCaller().getRequest(Urls.verifyEmail(email));
    _emailVerificationInProgress=false;
    update();
    if(response.isSuccess){
      _message=response.responseJson?['data'] ?? '';
      return true;
    }else{
      return false;
    }


  }

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
    secondsRemaining = 120;
    enableResend = false;

    update();
  }




}