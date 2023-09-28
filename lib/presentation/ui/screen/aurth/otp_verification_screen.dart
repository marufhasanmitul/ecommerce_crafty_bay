

import 'package:ecommerce_crafty_bay/presentation/state_holders/otp_varification_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/screen/aurth/complete_profile_screen.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/screen/main_bottom_nav_screen.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/image_assets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';


class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {



  final OtpVerificationController _otpVerificationController=Get.put(OtpVerificationController());



  @override
  void initState() {
    super.initState();
    _otpVerificationController.timerCode();
  }
  final _formKey = GlobalKey<FormState>();


  TextEditingController pinCodeEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Center(
                    child: SvgPicture.asset(
                  ImageAssets.craftyBayLogoSvg,
                  width: 120,
                )),
                const SizedBox(
                  height: 25,
                ),
                Text("Enter OTP Code",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Text("A 4 Digit OTP Code has been Send",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.black54)),
                const SizedBox(
                  height: 20,
                ),
                PinCodeTextField(

                  appContext: context,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  keyboardType: TextInputType.number,
                  errorTextSpace: 25,
                  errorTextMargin: const EdgeInsets.symmetric(horizontal: 30),

                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.white,
                  enableActiveFill: true,
                  //errorAnimationController: errorController,
                  controller: pinCodeEditingController,
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  validator: (value) {
                    if (value.toString().isEmpty || value!.length != 4) {
                      return "Please Enter valid Pin code";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                GetBuilder<OtpVerificationController>(
                  builder: (controller){
                    if(controller.otpVerificationInProgress){
                      return const Center(child: CircularProgressIndicator(),);
                    }else{
                      return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  verifyOtp(controller);
                                }
                              },
                              child: const Text(
                                "Next",
                              ))) ;
                    }

                  },

                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'This Code will expire in ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    GetBuilder<OtpVerificationController>(
                      builder: (GetxController controller){
                        return Text("${_otpVerificationController.secondsRemaining} S",style: const TextStyle(
                            fontSize: 17,
                            color: AppColors.primaryColor
                        ),);
                      },

                    ),
                  ],
                ),
                TextButton(
                    onPressed: _otpVerificationController.enableResend ? _otpVerificationController.resendCode : null,
                    child: const Text(
                      'Resend Code',
                      style: TextStyle(color: Colors.grey),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }



  Future<void> verifyOtp(OtpVerificationController controller)async{
    final response=await controller.verifyOtp(widget.email, pinCodeEditingController.text.trim());
    if(response==true){
      Get.offAll(()=>const MainBottomNavScreen());
    }else{
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Otp Verification failed")));
      }

    }
  }


  @override
  dispose(){
    _otpVerificationController.timer?.cancel();
    super.dispose();
  }


}
