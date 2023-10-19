import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nabgh_app/pages/auth_page/reset_password_page.dart';
import 'package:nabgh_app/pages/main_screen/main_screen.dart';
import 'package:pinput/pinput.dart';

import '../../constatns/app_constants.dart';
import '../../widget/app_small_button.dart';
import '../../widget/auth_background.dart';

class ForgotPinInputPage extends StatefulWidget {
  static const routeName = "forgot-pin-input-page";

  const ForgotPinInputPage({Key? key}) : super(key: key);

  @override
  _RoundedWithCustomCursorState createState() =>
      _RoundedWithCustomCursorState();

  @override
  String toStringShort() => 'Rounded With Cursor';
}

class _RoundedWithCustomCursorState extends State<ForgotPinInputPage> {
  int secondsRemaining = 30;
  bool enableResend = false;
  late Timer timer;

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  TextEditingController pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  String resendText = "Resend";

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    timer.cancel();
    super.dispose();
  }

  void _resendCode() {
    setState(() {
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final focusedBorderColor = Colors.white.withOpacity(.7);
    final fillColor = Colors.transparent;
    final borderColor = Colors.white.withOpacity(.2);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
    );

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
                  "OTP",
                  style: TextStyle(fontSize: 32),
                ),
                Text(
                  "Enter the OTP code sent on the email you entered",
                  style: TextStyle(color: Colors.white.withOpacity(.6)),
                ),
                SizedBox(
                  height: height * .05,
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Pinput(
                    length: 5,
                    controller: pinController,
                    focusNode: focusNode,
                    androidSmsAutofillMethod:
                        AndroidSmsAutofillMethod.smsUserConsentApi,
                    listenForMultipleSmsOnAndroid: true,
                    defaultPinTheme: defaultPinTheme,
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    onCompleted: (pin) async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      pinController = TextEditingController();
                    },
                    cursor: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 9),
                          width: 22,
                          height: 1,
                          color: focusedBorderColor,
                        ),
                      ],
                    ),
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: focusedBorderColor),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        color: fillColor,
                        borderRadius: BorderRadius.circular(19),
                        border: Border.all(color: focusedBorderColor),
                      ),
                    ),
                    errorPinTheme: defaultPinTheme.copyBorderWith(
                      border: Border.all(color: Colors.redAccent),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .05,
                ),
                Container(
                    height: 45,
                    child: AppSmallButton(
                        title:  Text("Verify", style:TextStyle(fontSize: 16,color: Colors.black),
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(PasswordResetPage.routeName);
                        })),
                SizedBox(
                  height: height * .38,
                ),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style:
                          const TextStyle(fontSize: 18.0, color: Colors.white),
                      children: [
                        TextSpan(
                          text: 'Didn\'t receive the OTP? ',
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white.withOpacity(.6)),
                        ),
                        WidgetSpan(
                          child: InkWell(
                              onTap: () {
                               },
                              child: Text(
                                'Resend',
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
              ],
            )),
          ),
        ],
      ),
    );
  }
}
