import 'package:flutter/material.dart';
import 'package:nabgh_app/model/faq_model.dart';

import '../../../../widget/app_back_button.dart';

class FaqPage extends StatefulWidget {
  static const routeName = "faq-page";

  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
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
              "FAQ",
              style: TextStyle(fontSize: 18),
            ),
            Spacer(),
          ],
        ),
      );
    }

    buildFAQCard({required List faqItems}) {
      return Container(
        color: Colors.black.withOpacity(.8),
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(children: [
          ...faqItems.map((faq) {
            return Column(
              children: [
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    initiallyExpanded: false,
                    title: Text(
                      faq.question,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.white.withOpacity(.9)),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16, bottom: 12),
                        child: Text(
                          faq.answer,
                          style: TextStyle(
                              letterSpacing: 1.5, color: Colors.white60),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  margin: EdgeInsets.only(top: 8),
                  height: 1,
                ),
              ],
            );
          })
        ]),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding:
                    EdgeInsets.only(top: 8, left: 12, right: 12, bottom: 18),
                child: Column(
                  children: [
                    buildFAQCard(
                      faqItems: faqList,
                    ),
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
