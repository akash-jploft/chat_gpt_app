import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nabgh_app/pages/auth_page/fogrgot_password_page.dart';
import 'package:nabgh_app/pages/auth_page/forgot_pin_page.dart';
import 'package:nabgh_app/pages/auth_page/reset_password_page.dart';
import 'package:nabgh_app/pages/main_screen/main_screen.dart';
import 'package:nabgh_app/pages/profile_page/profile_page.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    // case ContactDetailPage.routeName:
    //   ContactUser contact = routeSettings.arguments as ContactUser;
    //   return MaterialPageRoute(
    //     builder: (_) =>
    //         ContactDetailPage(
    //           contact: contact,
    //         ),
    //   );

    case ForgotPasswordPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const ForgotPasswordPage(),
      );

    case ForgotPinInputPage.routeName:
      return MaterialPageRoute(
        builder: (_) => ForgotPinInputPage(),
      );

    case PasswordResetPage.routeName:
      return MaterialPageRoute(
        builder: (_) => PasswordResetPage(),
      );

    case MainScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => MainScreen(),
      );

    case ProfilePage.routeName:
      return MaterialPageRoute(
        builder: (_) => ProfilePage(),
      );

    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("route not implemented "),
                ),
              ));
  }
}
