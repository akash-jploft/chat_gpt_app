import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constatns/app_constants.dart';

class AppSmallButton extends StatelessWidget {
  final Widget title;
  final VoidCallback onTap;

  const AppSmallButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: AppConstants.gradient),
          child:
      title,
    ))
    ;
  }
}
