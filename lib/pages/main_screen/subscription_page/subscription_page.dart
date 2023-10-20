import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nabgh_app/constatns/app_constants.dart';
import 'package:nabgh_app/pages/main_screen/subscription_page/subscription_success_modal.dart';
import 'package:nabgh_app/widget/app_back_button.dart';

import '../../../widget/user_profile.dart';

class SubscriptionPage extends StatefulWidget {
  static const routeName = "subscription-page";

  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  int selectedIdx = 0;
  List<SubscriptionPriceModel> subscriptionList = [
    SubscriptionPriceModel(
        title: 'Popular', duration: 'Weekly', price: '\$7.99'),
    SubscriptionPriceModel(
        title: '3 Day free trail', duration: 'Monthly', price: '\$14.99'),
    SubscriptionPriceModel(
        title: 'Best price', duration: 'Yearly', price: '\$79.99'),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Widget buildAppBar() {
      return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16).copyWith(top: 12),
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

    Widget selectedCard({required SubscriptionPriceModel subscription}) {
      return Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Container(
          width: width * .4,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: AppConstants.secondaryColor),
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: Text(
                  subscription.title,
                  style: TextStyle(color: Colors.black),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)),
              ),
              Spacer(),
              Text(
                subscription.duration,
                style: TextStyle(color: Colors.white.withOpacity(.9)),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                subscription.price,
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      );
    }

    Widget unSelectedCard({required SubscriptionPriceModel subscription}) {
      return Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Container(
          width: width * .4,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: AppConstants.secondaryColor, width: .8),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: Text(
                  subscription.title,
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: AppConstants.secondaryColor,
                    borderRadius: BorderRadius.circular(24)),
              ),
              Spacer(),
              Text(
                subscription.duration,
                style: TextStyle(color: Colors.white.withOpacity(.9)),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                subscription.price,
                style: TextStyle(
                    fontSize: 25, color: Colors.white.withOpacity(.7)),
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      );
    }

    return Stack(
      children: [
        Opacity(
          opacity: .5,
          child: SvgPicture.asset(
            "assets/subscription_background.svg",
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                buildAppBar(),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * .13,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 10.0, sigmaY: 10.0),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    children: [
                                      Text('Experience Nabigh'),
                                      Text(
                                        'AT FULL POWER',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 28,
                            ),
                            Text(
                              "You have already used 3/3 of free \nrequests.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white.withOpacity(.7)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Container(
                          height: height * .2,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 16,
                                ),
                                ...subscriptionList.map((subscription) {
                                  int currIdx =
                                      subscriptionList.indexOf(subscription);

                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIdx = currIdx;
                                      });
                                    },
                                    child: Builder(builder: (context) {
                                      if (currIdx == selectedIdx) {
                                        return selectedCard(
                                            subscription: subscription);
                                      } else {
                                        return unSelectedCard(
                                            subscription: subscription);
                                      }
                                    }),
                                  );
                                }).toList()
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 38,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 18),
                        width: double.infinity,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            color: Colors.white),
                        child: InkWell(
                          onTap: (){
showDialog(context: context, builder: (builder){
  return SubsciptionScuccesModal();
});
                          },
                          child: Text(
                            "Try Free and Subscribe",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SubscriptionPriceModel {
  final String title;
  final String duration;
  final String price;

  SubscriptionPriceModel(
      {required this.title, required this.duration, required this.price});
}
