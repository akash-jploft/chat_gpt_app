import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nabgh_app/widget/app_small_button.dart';
import 'package:nabgh_app/widget/user_profile.dart';

import '../../../model/recent_search_model.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({super.key});

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  List<RecentSearchModel> searchList = [
    RecentSearchModel(title: "HTML for clip Image", isSelected: false),
    RecentSearchModel(
        title: "Title suggestion Contact Details", isSelected: false),
    RecentSearchModel(title: "UI Design", isSelected: false),
    RecentSearchModel(title: "UX Design", isSelected: false),
    RecentSearchModel(
        title: "Title suggestion \"Case Study\"", isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    buildAppBar() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0)
            .copyWith(bottom: 10, top: 4),
        child: Row(
          children: [

            SizedBox(width: 18,),
            Spacer(),
            Text(
              "Recent",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            Spacer(),
         UserProfile(),
          ],
        ),
      );
    }

    buildRecentCard({required RecentSearchModel recent}) {
      return Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: InkWell(
          onTap: () {
            int currIdx = searchList.indexOf(recent);

            searchList[currIdx] = RecentSearchModel(
                title: recent.title, isSelected: !recent.isSelected);
            setState(() {});
          },
          child: Container(
            height: 55,
            alignment: Alignment.centerLeft,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: recent.isSelected ? Color(0xff3C3C6A) : Colors.black,
                border: Border.all(color: Color(0xff3C3C6A))),
            child: Text(recent.title),
          ),
        ),
      );
    }

    return Scaffold(
        bottomNavigationBar: Container(
            margin: EdgeInsets.symmetric(horizontal: 18, vertical: 8).copyWith(bottom: 4),
            height: 50,
            child: AppSmallButton(
              title: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icon/delete.svg"),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Clear conversation',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Spacer(),
                ],
              ),
              onTap: () {
                searchList.removeWhere((element) => element.isSelected);
                setState(() {});
              },
            )),
        body: SafeArea(
          child: Column(
            children: [
              buildAppBar(),
              SizedBox(
                height: 8,
              ),
              Expanded(
                  child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    ...searchList
                        .map((search) => buildRecentCard(recent: search))
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
