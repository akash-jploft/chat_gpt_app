import 'package:flutter/cupertino.dart';

class AppConstants {
  static const Color primaryColor = Color(0xffDEFA8E);
  static const Color secondaryColor = Color(0xff06CFF1);
  static LinearGradient gradient = const LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      primaryColor,
      secondaryColor,
    ],
  );
}
