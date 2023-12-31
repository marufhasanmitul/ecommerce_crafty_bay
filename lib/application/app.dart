import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_crafty_bay/application/state_holder_binder.dart';
import 'package:ecommerce_crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import '../presentation/ui/screen/splash_screen.dart';

class CraftBay extends StatefulWidget {
  static GlobalKey<NavigatorState> globalKey=GlobalKey<NavigatorState>();
  const CraftBay({Key? key}) : super(key: key);

  @override
  State<CraftBay> createState() => _CraftBayState();
}

class _CraftBayState extends State<CraftBay> {
  late final StreamSubscription _connectivityStatusStream;

  @override
  void initState() {
    checkInitialInternetConnection();
    checkInternetConnectivityStatus();

    super.initState();
  }

  void checkInitialInternetConnection()async{
    final result=await Connectivity().checkConnectivity();
    handleConnectivityStates(result);
  }

  void checkInternetConnectivityStatus(){
    _connectivityStatusStream=Connectivity().onConnectivityChanged.listen((status) {
      handleConnectivityStates(status);
    });
  }


  void handleConnectivityStates(ConnectivityResult status) {
    if (status != ConnectivityResult.mobile && status != ConnectivityResult.wifi) {
      Get.showSnackbar(const GetSnackBar(
        title: 'No internet!',
        message: 'Please check your internet connectivity',
        isDismissible: false,
      ));
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeAllSnackbars();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        navigatorKey:CraftBay.globalKey,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        initialBinding:StateHolderBinder(),
        theme: ThemeData(
            primarySwatch:
                MaterialColor(AppColors.primaryColor.value, AppColors().color),

            inputDecorationTheme:  const InputDecorationTheme(

                contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 0),

                border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  width: 1,
                  color: AppColors.primaryColor,
                ))),

            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  textStyle: const TextStyle(
                      fontSize: 16,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w600),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
            )));
  }

  @override
  void dispose() {
    _connectivityStatusStream.cancel();
    super.dispose();
  }
}


