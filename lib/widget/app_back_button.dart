import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constatns/app_constants.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: CircleAvatar(
          backgroundColor: AppConstants.secondaryColor,
          child: SvgPicture.asset("assets/icon/back.svg")),
    );
  }
}
