import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nabgh_app/widget/app_small_button.dart';

class SubsciptionScuccesModal extends StatelessWidget {
  const SubsciptionScuccesModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey.shade900,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              right: 4,
              top: 4,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: SvgPicture.asset(
                    "assets/icon/close.svg",
                    color: Colors.white.withOpacity(.8),
                  ))),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/icon/success.png",
                height: 120,
              ),
              Text(
                "Congratulations",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "You are subscribed member now!",
                style: TextStyle(color: Colors.white.withOpacity(.7)),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 40,
                width: 150,
                child: AppSmallButton(
                    title: Text(
                      "OK",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    }),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
