import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nabgh_app/pages/main_screen/main_screen.dart';

import '../../widget/app_small_button.dart';
import '../../widget/app_textField.dart';
import '../../widget/auth_background.dart';

class PasswordResetPage extends StatelessWidget {
  static const routeName = "reset-password-page";

  const PasswordResetPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          AuthBackground(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height * .08),
                        child: SvgPicture.asset("assets/icon/brain.svg",
                            height: height * .08, width: width * .8),
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  const Text(
                    "Reset Password",
                    style: TextStyle(fontSize: 32),
                  ),
                  Text(
                    "Sign in to continue",
                    style: TextStyle(color: Colors.white.withOpacity(.6)),
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  AppTextField(
                      controller: passwordController,
                      imgSrc: "assets/icon/lock.svg",
                      title: "Password"),
                  SizedBox(
                    height: height * .02,
                  ),
                  AppTextField(
                      controller: confirmPasswordController,
                      imgSrc: "assets/icon/lock.svg",
                      title: "Confirm Password"),
                  SizedBox(
                    height: height * .04,
                  ),
                  Container(
                      height: 45,
                      child: AppSmallButton(
                          title:  Text( "Reset password",
                            style: TextStyle(fontSize: 16,color: Colors.black),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(MainScreen.routeName);
                          })),
                  SizedBox(
                    height: height * .02,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
