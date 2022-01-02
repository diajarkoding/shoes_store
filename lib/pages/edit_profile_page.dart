import 'package:flutter/material.dart';
import 'package:toko_sepatu/shared/theme.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.close,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: backgroudColor1,
        elevation: 0,
        centerTitle: true,
        title: const Text('Edit Profile'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.check,
                color: primaryColor,
              ))
        ],
      );
    }

    Widget nameInput() {
      return Padding(
        padding: const EdgeInsets.only(bottom: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
            TextFormField(
              style: primaryTextStyle.copyWith(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'Alex keinnzal',
                hintStyle: primaryTextStyle.copyWith(fontSize: 16),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleTextColor),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget userNameInput() {
      return Padding(
        padding: const EdgeInsets.only(bottom: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
            TextFormField(
              style: primaryTextStyle.copyWith(fontSize: 16),
              decoration: InputDecoration(
                hintText: '@alexkeinn',
                hintStyle: primaryTextStyle.copyWith(fontSize: 16),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleTextColor),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget emailInput() {
      return Padding(
        padding: const EdgeInsets.only(bottom: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
            TextFormField(
              style: primaryTextStyle.copyWith(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'alex.kein@gmail.com',
                hintStyle: primaryTextStyle.copyWith(fontSize: 16),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: subtitleTextColor),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(
                    top: defaultMargin, bottom: defaultMargin),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/image_profile.png'))),
              ),
            ),
            nameInput(),
            userNameInput(),
            emailInput(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroudColor3,
      appBar: header(),
      body: content(),
    );
  }
}
