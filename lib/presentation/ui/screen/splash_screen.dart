import 'package:ecommerce_crafty_bay/presentation/ui/utils/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    goToHomeScreen();
  }


    void goToHomeScreen(){
      Future.delayed(const Duration(seconds: 5)).then((value){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=>const HomeScreen() ), (route) => false);
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(child: SvgPicture.asset(ImageAssets.craftyBayLogoSvg,width: 120,)),
            const Spacer(),
            const CircularProgressIndicator(),
            const SizedBox(height: 20,),
            const Text("version 1.0.0"),
            const SizedBox(height: 20,)
          ],
      ),
    );
  }
}
