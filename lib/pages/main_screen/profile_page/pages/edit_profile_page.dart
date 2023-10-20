import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nabgh_app/constatns/app_constants.dart';
import 'package:nabgh_app/widget/app_back_button.dart';
import 'package:nabgh_app/widget/app_small_button.dart';

import '../../../../widget/app_textField.dart';


class EditProfilePage extends StatefulWidget {
  static const routeName = "edit-profile-page";

  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final ImagePicker picker = ImagePicker();
  XFile? selectedImage;
  final TextEditingController nameController =
      TextEditingController(text: "Thomas Cook");
  final TextEditingController emailController =
      TextEditingController(text: "thomas_cook@gmail.com");
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  buildAppBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 6, bottom: 8),
      child: Row(
        children: [
          AppBackButton(),
          Spacer(),
          Text(
            "My Profile",
            style: TextStyle(fontSize: 18),
          ),
          Spacer(),
        ],
      ),
    );
  }

  buildImagePicker() {
    return Stack(
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.all(24),
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Theme.of(context).primaryColor.withOpacity(.2)),
                color: Color(0xff343434)),
            child: selectedImage == null
                ? ClipOval(
                    child: SvgPicture.asset("assets/icon/brain.svg"),
                  )
                : ClipOval(
                    child: Image.memory(
                      File(selectedImage!.path).readAsBytesSync(),
                      fit: BoxFit.cover,
                      // width: 150,
                      // height: 150,
                    ),
                  ),
          ),
        ),
        Positioned(
            bottom: 10,
            right: MediaQuery.of(context).size.width * .28,
            child: InkWell(
              onTap: () async {
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  setState(() {
                    selectedImage = image;
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppConstants.secondaryColor,
                ),
                padding: const EdgeInsets.all(7),
                child: const Icon(
                  CupertinoIcons.camera_fill,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ))
      ],
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
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    buildImagePicker(),
                    SizedBox(
                      height: 30,
                    ),
                    AppTextField(
                        controller: nameController,
                        imgSrc: "assets/icon/name_input.svg",
                        title: "Name"),
                    SizedBox(
                      height: 30,
                    ),
                    AppTextField(
                        controller: emailController,
                        imgSrc: "assets/icon/mail.svg",
                        title: "Enter your email id"),
                    SizedBox(
                      height: 30,
                    ),
                    AppTextField(
                        controller: passwordController,
                        imgSrc: "assets/icon/lock.svg",
                        title: "Password"),
                    SizedBox(
                      height: 30,
                    ),
                    AppTextField(
                        controller: passwordConfirmationController,
                        imgSrc: "assets/icon/lock.svg",
                        title: "Confirm Password"),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 45,
                      child: AppSmallButton(
                        title: Text(
                          "Save",
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {},
                      ),
                    )
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
