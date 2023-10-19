import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nabgh_app/constatns/app_constants.dart';

import '../../../widget/user_profile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedTagIdx = 0;
  List<SuggestionCardModel> suggestions = [
    SuggestionCardModel(
        color: Color(0xff39D9DC),
        title: "Write a paragraph",
        subtitle: "General well-written paragraph on any given subject",
        imgSrc: "assets/icon/suggestion_1.svg"),
    SuggestionCardModel(
        color: Color(0xff29FDBB),
        title: "Write a paragraph",
        subtitle: "General well-written paragraph on any given subject",
        imgSrc: "assets/icon/suggestion_2.svg"),
    SuggestionCardModel(
        color: Color(0xffFAFAFA),
        title: "Write a paragraph",
        subtitle: "General well-written paragraph on any given subject",
        imgSrc: "assets/icon/suggestion_3.svg"),
    SuggestionCardModel(
        color: Color(0xffEF96FE),
        title: "Write a paragraph",
        subtitle: "General well-written paragraph on any given subject",
        imgSrc: "assets/icon/suggestion_4.svg"),
  ];

  buildAppBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 16),
      child: Row(
        children: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset("assets/icon/menu.svg")),
          Spacer(),
          UserProfile(),
        ],
      ),
    );
  }

  buildHeader() {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: 18).copyWith(top: 32, bottom: 44),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
                color: Colors.white54.withOpacity(.2),
                blurRadius: 1,
                offset: Offset(0.0, 2)),
          ],
          borderRadius: BorderRadius.circular(28.0)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hey Thomas",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "How I can help you today?",
                style: TextStyle(color: Colors.white54),
              ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
          Spacer(),
          SvgPicture.asset(
            "assets/icon/brain.svg",
            height: 60,
          )
        ],
      ),
    );
  }

  buildSuggestionCard({required SuggestionCardModel suggestion}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: suggestion.color,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 18,
          ),
          SvgPicture.asset(suggestion.imgSrc),
          SizedBox(
            height: 4,
          ),
          Text(
            suggestion.title,
            style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            suggestion.subtitle,
            style: TextStyle(color: Colors.black.withOpacity(.7)),
          ),
        ],
      ),
    );
  }

  buildSuggesstion() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 22.0, mainAxisSpacing: 22.0),
      itemBuilder: (BuildContext context, int index) {
        return buildSuggestionCard(
          suggestion: suggestions[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> tagList = [
      "Mostly popular",
      "Random",
      "Writing",
      "More",
      "Books"
    ];
    buildTag({required String title}) {
      int currIdx = tagList.indexOf(title);
      return Padding(
        padding: EdgeInsets.only(right: 12),
        child: InkWell(
          onTap: () {
            setState(() {
              selectedTagIdx = currIdx;
            });
          },
          child: selectedTagIdx == currIdx
              ? Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: AppConstants.gradient),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ))
              : Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Color(0xff3E3E3E)),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white70,
                    ),
                  )),
        ),
      );
    }

    buildTags() {
      return Container(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [...tagList.map((tag) => buildTag(title: tag))],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildHeader(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Suggestion for today",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          buildSuggesstion(),
                          SizedBox(
                            height: 28,
                          ),
                          buildTags(),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
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

class SuggestionCardModel {
  final Color color;
  final String imgSrc;
  final String title;
  final String subtitle;

  SuggestionCardModel(
      {required this.color,
      required this.subtitle,
      required this.title,
      required this.imgSrc});
}
