import 'dart:async';


import 'package:ecommerce_crafty_bay/data/models/network_response.dart';
import 'package:ecommerce_crafty_bay/data/utility/network_caller.dart';
import 'package:ecommerce_crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/state_holders/email_verification_controller.dart';
import 'package:get/get.dart';
import '../../data/utility/urls.dart';

class OtpVerificationController extends GetxController{


  bool _otpVerificationInProgress=false;
  String _message='';
  bool get otpVerificationInProgress =>_otpVerificationInProgress;
  String get message => _message;

  Future<bool> verifyOtp(String email,String otp)async{
      _otpVerificationInProgress=true;
      update();
      final NetworkResponse response=await NetworkCaller().getRequest(Urls.verifyOtp(email,otp));

      if(response.isSuccess){
        _otpVerificationInProgress=false;
        update();



        await AuthController.setAccessToken(response.responseJson?['data']);
        _message=response.responseJson?['data'] ?? '';
        return true;
      }else{
        return false;
      }
  }






}