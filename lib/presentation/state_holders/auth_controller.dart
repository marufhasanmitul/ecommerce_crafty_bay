import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String? _accessToken;



  static String? get accessToken => _accessToken;


 static Future<void> setAccessToken(String token) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('access-token', token);
    _accessToken = token;
  }

  static Future<void> getAccessToken() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _accessToken= sharedPreferences.getString('access-token');

  }
  static Future<void>clear()async{
   final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   await sharedPreferences.clear();
  }

  static bool get isLogin{
    return _accessToken != null;

  }




}
