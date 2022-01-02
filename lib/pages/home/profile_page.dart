import 'package:flutter/material.dart';
import 'package:toko_sepatu/shared/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'profile page',
        style: primaryTextStyle,
      ),
    );
  }
}
