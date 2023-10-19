import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nabgh_app/constatns/app_constants.dart';
import 'package:nabgh_app/pages/main_screen/recent_page/recent_page.dart';
import 'package:nabgh_app/pages/main_screen/search_page/search_screen.dart';

import 'discover_page/discover_page.dart';

class MainScreen extends StatefulWidget {
  static const routeName = "main-screen-page";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIdx = 1;

  buildBottomBar() {
    bool isDiscoverSelected = pageIdx == 0;
    bool isSearchSelected = pageIdx == 1;
    bool isRecentSelected = pageIdx == 2;
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  pageIdx = 0;
                });
              },
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/icon/discover.svg",
                    color: isDiscoverSelected
                        ? AppConstants.secondaryColor
                        : Colors.white70,
                  ),
                  Text(
                    "Discover",
                    style: TextStyle(
                      color: isDiscoverSelected
                          ? AppConstants.secondaryColor
                          : Colors.white70,
                    ),
                  )
                ],
              )),
          Spacer(),
          InkWell(
              onTap: () {
                setState(() {
                  pageIdx = 1;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white54,
                    ),
                    borderRadius: BorderRadius.circular(18)),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icon/search.svg"),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(color: AppConstants.secondaryColor),
                    )
                  ],
                ),
              )),
          Spacer(),
          IconButton(
              onPressed: () {
                setState(() {
                  pageIdx = 2;
                });
              },
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/icon/recent.svg",
                    color: isRecentSelected
                        ? AppConstants.secondaryColor
                        : Colors.white70,
                  ),
                  Text(
                    "Recent",
                    style: TextStyle(
                      color: isRecentSelected
                          ? AppConstants.secondaryColor
                          : Colors.white70,
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget getBody({required int index}) {
    switch (index) {
      case 0:
        return DiscoverPage();
      case 1:
        return SearchScreen();
      case 2:
        return RecentPage();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomBar(),
      body: getBody(index: pageIdx),
    );
  }
}
