import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../widget/app_back_button.dart';


class PrivacyPolicyPage extends StatelessWidget {
  static const routeName = "privacy-policy-page";

  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    buildAppBar() {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 16).copyWith(top: 6, bottom: 8),
        child: Row(
          children: [
            AppBackButton(),
            Spacer(),
            Text(
              "Privacy policy",
              style: TextStyle(fontSize: 18),
            ),
            Spacer(),
          ],
        ),
      );
    }

    final contennt =
        '''<p>These Website Standard Terms and Conditions written on this webpage shall manage your use of our website, Webiste Name accessible at Website.com.<br />\r\n<br />\r\nThese Terms will be applied fully and affect to your use of this Website. By using this Website, you agreed to accept all terms and conditions written in here. You must not use this Website if you disagree with any of these Website Standard Terms and Conditions.<br />\r\n<br />\r\nMinors or people below 18 years old are not allowed to use this Website.</p>\r\n\r\n<h4>License</h4>\r\n\r\n<ul>\r\n\t<li>Provide industry leading customer support via e-mail, chat and social media</li>\r\n\t<li>Improve the customer experience by taking a proactive approach in solving</li>\r\n\t<li>Take ownership of issues and follow problems through to resolution.</li>\r\n\t<li>Assist in developing customer support procedures, policies and standards</li>\r\n</ul>\r\n\r\n<h4>Restrictions</h4>\r\n\r\n<p>You are specifically restricted from all of the following:</p>\r\n\r\n<ul>\r\n\t<li>Publishing any Website material in any other media;</li>\r\n\t<li>Selling, sublicensing and/or otherwise commercializing any Website material;</li>\r\n\t<li>Publicly performing and/or showing any Website material;</li>\r\n\t<li>Using this Website in any way that is or may be damaging to this Website;</li>\r\n\t<li>Using this Website in any way that impacts user access to this Website;</li>\r\n\t<li>Using this Website contrary to applicable laws and regulations, or in any way may cause harm to the Website, or to any person or business entity;</li>\r\n\t<li>Engaging in any data mining, data harvesting, data extracting or any other similar activity in relation to this Website;</li>\r\n\t<li>Using this Website to engage in any advertising or marketing.</li>\r\n</ul>\r\n\r\n<p>Certain areas of this Website are restricted from being access by you and Company Name may further restrict access by you to any areas of this Website, at any time, in absolute discretion. Any user ID and password you may have for this Website are confidential and you must maintain confidentiality as well.</p>
    ''';
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ).copyWith(top: 12, bottom: 18),
                child: HtmlWidget(
                  contennt,
                  textStyle: TextStyle(color: Colors.white70),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
