import 'package:flutter/material.dart';
import 'package:toko_sepatu/shared/theme.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar();
    }

    return Center(
      child: Text(
        'wishlist page',
        style: primaryTextStyle,
      ),
    );
  }
}
