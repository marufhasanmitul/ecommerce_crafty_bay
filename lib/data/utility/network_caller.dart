import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce_crafty_bay/application/app.dart';
import 'package:ecommerce_crafty_bay/data/models/network_response.dart';
import 'package:ecommerce_crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/screen/aurth/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(Uri.parse(url),
      headers: {
        'token': AuthController.accessToken.toString()
      }
      );
      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 200 &&
          jsonDecode(response.body)['msg'] == 'success') {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        gotoLogin();
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }

    return NetworkResponse(false, -1, null);
  }

  Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body) async {
    try {
      Response response = await post(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'token': AuthController.accessToken.toString()
          },
          body: jsonEncode(body)
      );

      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 200 && jsonDecode(response.body)['msg'] == 'success') {

        return NetworkResponse( true, response.statusCode,  jsonDecode(response.body) );


      } else if (response.statusCode == 401) {
        gotoLogin();
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }

    return NetworkResponse(false, -1, null);
  }

  Future<void> gotoLogin() async {
     await AuthController.clear();
     Navigator.pushAndRemoveUntil(CraftBay.globalKey.currentContext!, MaterialPageRoute(builder:(context)=>const EmailVerificationScreen()), (route) => false);
  }
}


