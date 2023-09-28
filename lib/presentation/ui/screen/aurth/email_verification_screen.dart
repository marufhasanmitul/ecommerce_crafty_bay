import 'package:ecommerce_crafty_bay/presentation/state_holders/email_verification_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/screen/aurth/otp_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/image_assets.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextEditingController= TextEditingController();

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
                Text("Welcome Back",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.black54, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Text("Please Enter Your Email Address",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.black54)),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailTextEditingController,
                  decoration: const InputDecoration(
                    hintText: "Email Address",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your email';
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                    width: double.infinity,
                  child: GetBuilder<EmailVerificationController>(
                      builder: (controller) {
                        if (controller.emailVerificationInProgress) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              verifyEmail(controller);
                            }
                          },
                          child: const Text('Next'),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyEmail(EmailVerificationController controller) async {
    final response =
    await controller.verifyEmail(_emailTextEditingController.text.trim());
    if (response) {
      Get.to(() =>  OTPVerificationScreen(email: _emailTextEditingController.text.trim(),));
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email verification failed! Try again'),
          ),
        );
      }
    }
  }
}
