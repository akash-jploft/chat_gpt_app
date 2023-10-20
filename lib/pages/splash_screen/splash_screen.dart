

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nabgh_app/pages/splash_screen/feature_showcase_papge.dart';
import 'package:nabgh_app/widget/auth_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToNextPage();
    super.initState();
  }

  goToNextPage()async{
   await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder){
      return FeatureShowCasePage();
    }));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          AuthBackground(),
          Scaffold(
            backgroundColor: Colors.transparent,

            body: SafeArea(
              child: Center(
                child: SvgPicture.asset("assets/app_icon.svg",height: 80,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
