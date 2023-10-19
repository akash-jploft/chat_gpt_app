import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../model/feature_showcase_model.dart';
import '../../widget/app_small_button.dart';
import '../auth_page/login_page.dart';

class FeatureShowCasePage extends StatefulWidget {
  const FeatureShowCasePage({super.key});

  @override
  State<FeatureShowCasePage> createState() => _FeatureShowCasePageState();
}

class _FeatureShowCasePageState extends State<FeatureShowCasePage> {
  final PageController pageController = PageController();
  List<FeatureShowCaseModel> featureList = [
    FeatureShowCaseModel(
        subtitle:
            "An excellence recourse for every individual to get things done in easiest way",
        title: "This can help you anytime, anywhere",
        imgPath: "assets/showcase/showcase_1.svg"),
    FeatureShowCaseModel(
        subtitle:
            "An excellence recourse for every individual to get things done in easiest way",
        title: "This can help you anytime, anywhere",
        imgPath: "assets/showcase/showcase_2.svg"),
    FeatureShowCaseModel(
        subtitle:
            "An excellence recourse for every individual to get things done in easiest way",
        title: "This can help you anytime, anywhere",
        imgPath: "assets/showcase/showcase_3.svg"),
  ];

  onNext() {
    setState(() {
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  onBack() {}

  goToNextPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
      return LoginPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    buildFeatureDetail({required int index}) {
      var feature = featureList[index];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            Spacer(
              flex: 3,
            ),
            SvgPicture.asset(feature.imgPath,
                height: height * .32, width: width * .8),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .05),
              child: Text(
                feature.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Text(
              feature.subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white.withOpacity(.6)),
            ),
            SizedBox(
              height: height * .08,
            ),
            Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(featureList.length, (id) {
                  if (id == index) {
                    return Container(
                      width: 28,
                      height: 10,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: Color(0xff06CFF1))),
                    );
                  } else {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        Icons.circle,
                        size: 12,
                        color: Colors.white.withOpacity(.7),
                      ),
                    );
                  }
                }).toList()),
            Spacer(
              flex: 2,
            ),
            index == 2
                ? Container(
                    width: 120,
                    height: 40,
                    child: AppSmallButton(
                      onTap: goToNextPage,
                      title: Text('Start now',
                        style: TextStyle(fontSize: 16,color: Colors.black),
                    )),
                  )
                : Row(
                    children: [
                      TextButton(
                          onPressed: goToNextPage,
                          child: Text(
                            "Skip",
                            style: TextStyle(color: Color(0xff06CFF1)),
                          )),
                      Spacer(),
                      AppSmallButton(
                        onTap: onNext,
                        title: Text('Next',
                          style: TextStyle(fontSize: 16,color: Colors.black),
                        ),
                      )
                    ],
                  ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: .5,
            child: SvgPicture.asset(
              "assets/app_background.svg",
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          PageView.builder(
              itemCount: featureList.length,
              controller: pageController,
              itemBuilder: (context, index) {
                return buildFeatureDetail(index: index);
              }),
        ],
      ),
    );
  }
}
