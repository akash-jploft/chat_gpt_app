import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nabgh_app/constatns/app_constants.dart';

import '../../../model/discover_card_model.dart';
import '../../../widget/user_profile.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<DiscoverCardModel> discoverCardList = [
    DiscoverCardModel(
        imgSrc: 'assets/discover/art.svg',
        title: 'Art',
        subTitle: 'Extract key points from long text.'),
    DiscoverCardModel(
        imgSrc: 'assets/discover/booking.svg',
        title: 'Booking',
        subTitle: 'Extract key points from long text.'),
    DiscoverCardModel(
        imgSrc: 'assets/discover/code.svg',
        title: 'Code',
        subTitle: 'Extract key points from long text.'),
    DiscoverCardModel(
        imgSrc: 'assets/discover/entertenment.svg',
        title: 'Entertainment',
        subTitle: 'Extract key points from long text.'),
    DiscoverCardModel(
        imgSrc: 'assets/discover/translator.svg',
        title: 'Translator',
        subTitle: 'Extract key points from long text.'),
    DiscoverCardModel(
        imgSrc: 'assets/discover/art.svg',
        title: 'Health',
        subTitle: 'Extract key points from long text.'),
    DiscoverCardModel(
        imgSrc: 'assets/discover/music.svg',
        title: 'Music',
        subTitle: 'Extract key points from long text.'),
  ];

  buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(bottom: 10,top: 4),
      child: Row(
        children: [
          Spacer(),
          Text("Discover",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
          Spacer(),
          UserProfile(),
        ],
      ),
    );
  }

  buildDiscoverCard({required DiscoverCardModel discover}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Color(0xff3B3B3B),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 18,
          ),
          SvgPicture.asset(
            discover.imgSrc,
            height: 30,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            discover.title,
            style: TextStyle(
                color: AppConstants.secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            discover.subTitle,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          buildAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 8,),
                  GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: discoverCardList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 22.0,
                        mainAxisSpacing: 22.0),
                    itemBuilder: (BuildContext context, int index) {
                      return buildDiscoverCard(
                        discover: discoverCardList[index],
                      );
                    },
                  ),

                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
