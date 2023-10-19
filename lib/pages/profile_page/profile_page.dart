import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nabgh_app/constatns/app_constants.dart';
import 'package:nabgh_app/widget/app_small_button.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = "profile-page";

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  buildAppBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18).copyWith(top: 4, bottom: 8),
      child: Row(
        children: [
          CircleAvatar(
              backgroundColor: AppConstants.secondaryColor,
              child: SvgPicture.asset("assets/icon/back.svg")),
          Spacer(),
          Text(
            "My Profile",
            style: TextStyle(fontSize: 18),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppConstants.secondaryColor),
            child: Row(
              children: [
                SvgPicture.asset("assets/icon/edit.svg"),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Edit",
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  buildProfile() {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          padding: EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Color(0xff343434),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset("assets/icon/brain.svg"),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          "Thomas",
          style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(.9)),
        ),
        Text(
          "thomas_cook@gmail.com",
          style: TextStyle(color: Colors.white.withOpacity(.6)),
        ),
      ],
    );
  }

  buildMenuTile({required String title, required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(left: 18),
          width: double.infinity,
          alignment: Alignment.centerLeft,
          height: 55,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
          child: Text(title),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              buildAppBar(),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildProfile(),
                    SizedBox(
                      height: 30,
                    ),
                    buildMenuTile(title: "Account Settings", onTap: () {}),
                    buildMenuTile(title: "Help", onTap: () {}),
                    buildMenuTile(title: "Change password", onTap: () {}),
                    buildMenuTile(title: "Privacy policy", onTap: () {}),
                    buildMenuTile(title: "Terms & Conditions", onTap: () {}),
                    buildMenuTile(
                        title: "Subscription Management", onTap: () {}),
                    buildMenuTile(title: "FAQ", onTap: () {}),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      height: 45,
                      child: AppSmallButton(
                          title: Row(
                            children: [
                              Spacer(),
                              SvgPicture.asset("assets/icon/logout.svg"),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Logout",
                                style: TextStyle(color: Colors.black),
                              ),
                              Spacer(),
                            ],
                          ),
                          onTap: () {}),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
