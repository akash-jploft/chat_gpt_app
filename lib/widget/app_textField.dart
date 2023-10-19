import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constatns/app_constants.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String imgSrc;

  const AppTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.imgSrc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 22,
              height: 22,
              //    padding: EdgeInsets.only(top: 12, bottom: 12),
              child: SvgPicture.asset(
                imgSrc,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: title,
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: .8,
          color: AppConstants.secondaryColor.withOpacity(.18),
        )
      ],
    );
  }
}
