import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/widgets/bottom_bar.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: kMainColor,
      duration: const Duration(seconds: 10),
      animationDuration: const Duration(seconds: 4),
      childWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            height: 300,
            width: 300,
            kAppLogo,
          ),
          const Text(
            'Your Store',
            style: TextStyle(
              color: Colors.white,
              fontFamily: kFontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 45,
            ),
          ),
        ],
      ),
      nextScreen: const BottomBar()
      
    );
  }
}
