import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../pages/main_screen/profile_page/profile_page.dart';

class UserProfile extends StatelessWidget {

  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ProfilePage.routeName);
      },
      child: Container(
        height: 40,
        width: 40,
        padding: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xff147758))),
        child: SvgPicture.asset("assets/icon/profile.svg"),
      ),
    );
  }
}
