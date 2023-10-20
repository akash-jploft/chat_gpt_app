import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nabgh_app/pages/auth_page/fogrgot_password_page.dart';
import 'package:nabgh_app/pages/auth_page/forgot_pin_page.dart';
import 'package:nabgh_app/pages/auth_page/reset_password_page.dart';
import 'package:nabgh_app/pages/main_screen/chat_page/chat_screen.dart';
import 'package:nabgh_app/pages/main_screen/main_screen.dart';
import 'package:nabgh_app/pages/main_screen/profile_page/pages/edit_profile_page.dart';
import 'package:nabgh_app/pages/main_screen/profile_page/pages/faq_page.dart';
import 'package:nabgh_app/pages/main_screen/profile_page/pages/privacy_policyy_page.dart';
import 'package:nabgh_app/pages/main_screen/profile_page/pages/terms_condition_page.dart';
import 'package:nabgh_app/pages/main_screen/profile_page/profile_page.dart';
import 'package:nabgh_app/pages/main_screen/subscription_page/subscription_detail_page.dart';
import 'package:nabgh_app/pages/main_screen/subscription_page/subscription_page.dart';

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

    case EditProfilePage.routeName:
      return MaterialPageRoute(
        builder: (_) => EditProfilePage(),
      );

    case PrivacyPolicyPage.routeName:
      return MaterialPageRoute(
        builder: (_) => PrivacyPolicyPage(),
      );

    case TermConditionPage.routeName:
      return MaterialPageRoute(
        builder: (_) => TermConditionPage(),
      );

    case SubscriptionPage.routeName:
      return MaterialPageRoute(
        builder: (_) => SubscriptionPage(),
      );

    case SubscriptionDetailPage.routeName:
      return MaterialPageRoute(
        builder: (_) => SubscriptionDetailPage(),
      );

    case FaqPage.routeName:
      return MaterialPageRoute(
        builder: (_) => FaqPage(),
      );

    case ChatPage.routeName:
      return MaterialPageRoute(
        builder: (_) => ChatPage(),
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
