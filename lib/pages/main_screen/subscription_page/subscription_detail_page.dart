import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nabgh_app/pages/main_screen/subscription_page/subscription_page.dart';
import 'package:nabgh_app/widget/app_small_button.dart';

import '../../../constatns/app_constants.dart';
import '../../../widget/app_back_button.dart';

class SubscriptionDetailPage extends StatelessWidget {
  static const routeName = "subscription_detail_page";

  const SubscriptionDetailPage({super.key});

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
              "Subscription",
              style: TextStyle(fontSize: 18),
            ),
            Spacer(),
            SizedBox(
              width: 18,
            )
          ],
        ),
      );
    }

    buildCard() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
                gradient: AppConstants.gradient),
            child: Text(
              "CURRENT PLAN",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      18,
                    ),
                    bottomRight: Radius.circular(18),
                    topRight: Radius.circular(18)),
                border: Border.all(color: AppConstants.secondaryColor)),
            child: Column(
              children: [
                SizedBox(
                  height: 18,
                ),
                Container(
                  child: Text(
                    "3 Days Free Trial",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  width: double.infinity,
                  alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                            18,
                          ),
                          bottomRight: Radius.circular(18),
                          topRight: Radius.circular(18)),
                      color: AppConstants.secondaryColor),
                ),
                SizedBox(
                  height: 22,
                ),
                Text(
                  "Monthly",
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "\$14.99",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          )
        ],
      );
    }

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 24),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppConstants.secondaryColor,
                    ),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: AppConstants.secondaryColor),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 22,
            ),
            Expanded(
              child: Container(
                  height: 45,
                  child: AppSmallButton(
                      title: Text(
                        "Upgrade",
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(SubscriptionPage.routeName);
                      })),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    buildCard()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
