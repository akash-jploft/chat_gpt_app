import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nabgh_app/constatns/app_constants.dart';
import 'package:nabgh_app/pages/main_screen/main_screen.dart';
import 'package:nabgh_app/widget/app_small_button.dart';
import 'package:nabgh_app/widget/app_textField.dart';

import '../../widget/auth_background.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  buildSocialIcon({required String imgSrc, required VoidCallback onTap}) {
    return InkWell(
      child: Image.asset(
        imgSrc,
        height: 35,
        width: 35,
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
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
              child: SingleChildScrollView(
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
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (builder) {
                              return MainScreen();
                            }));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: AppConstants.secondaryColor),
                            child: Text(
                              "Sign Up".toUpperCase(),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * .04,
                    ),
                    const Text(
                      "Hi",
                      style: TextStyle(fontSize: 32),
                    ),
                    Text(
                      "create new account",
                      style: TextStyle(color: Colors.white.withOpacity(.6)),
                    ),
                    SizedBox(
                      height: height * .05,
                    ),
                    AppTextField(
                        controller: nameController,
                        imgSrc: "assets/icon/name_input.svg",
                        title: "Name"),
                    SizedBox(
                      height: height * .02,
                    ),
                    AppTextField(
                        controller: emailController,
                        imgSrc: "assets/icon/mail.svg",
                        title: "Enter your email Id"),
                    SizedBox(
                      height: height * .02,
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
                        title: "Confirm password"),

                    SizedBox(
                      height: height * .03,
                    ),
                    Container(
                        height: 45,
                        child: AppSmallButton(title:  Text("Sign up",
                          style: TextStyle(fontSize: 16,color: Colors.black),
                        ), onTap: () {})),
                    SizedBox(
                      height: height * .02,
                    ),
                    Center(
                        child: TextButton(
                      onPressed: () {},
                      child: Text("Continue as Guest",
                          style: TextStyle(color: AppConstants.secondaryColor)),
                    )),
                    SizedBox(
                      height: height * .02,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * .15,
                        ),
                        Expanded(
                          child: Container(
                            height: .3,
                            color: Colors.white.withOpacity(.4),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "OR",
                          style: TextStyle(color: Colors.white.withOpacity(.6)),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Container(
                            height: .3,
                            color: Colors.white.withOpacity(.4),
                          ),
                        ),
                        SizedBox(
                          width: width * .15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * .035,
                    ),
                    Center(
                        child: Text(
                      "Social media login",
                      style: TextStyle(color: Colors.white.withOpacity(.6)),
                    )),
                    SizedBox(
                      height: height * .015,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        buildSocialIcon(
                            imgSrc: 'assets/icon/google.png', onTap: () {}),
                        SizedBox(
                          width: width * .05,
                        ),
                        buildSocialIcon(
                            imgSrc: 'assets/icon/facebook.png', onTap: () {}),
                        SizedBox(
                          width: width * .05,
                        ),
                        buildSocialIcon(
                            imgSrc: 'assets/icon/apple.png', onTap: () {}),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: height * .05,
                    ),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                              fontSize: 18.0, color: Colors.white),
                          children: [
                            TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white.withOpacity(.6)),
                            ),
                            WidgetSpan(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: AppConstants.secondaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
