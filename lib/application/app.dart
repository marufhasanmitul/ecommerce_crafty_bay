import 'package:ecommerce_crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import '../presentation/ui/screen/splash_screen.dart';

class CraftBay extends StatelessWidget {
  const CraftBay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        primarySwatch: MaterialColor(AppColors.primaryColor.value, AppColors().color)
      ),
    );
  }
}
