import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widget/app_small_button.dart';
import '../../widget/app_textField.dart';
import '../../widget/auth_background.dart';
import 'forgot_pin_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  static const routeName = "forgot-password-page";

  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
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
                    "Forgot Password",
                    style: TextStyle(fontSize: 32),
                  ),
                  Text(
                    "enter your email to forgot password",
                    style: TextStyle(color: Colors.white.withOpacity(.6)),
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  AppTextField(
                      controller: emailController,
                      imgSrc: "assets/icon/mail.svg",
                      title: "Enter your email Id"),
                  SizedBox(
                    height: height * .04,
                  ),
                  Container(
                      height: 45,
                      child: AppSmallButton(
                        title:  Text(    "Get OTP",
                      style: TextStyle(fontSize: 16,color: Colors.black),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ForgotPinInputPage.routeName);
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
