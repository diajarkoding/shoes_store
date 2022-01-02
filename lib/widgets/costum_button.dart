import 'package:flutter/material.dart';
import 'package:toko_sepatu/shared/theme.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final Function onPressed;
  const CustomButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.title,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(top: defaultMargin),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/signup');
        },
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          title,
          style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
        ),
      ),
    );
  }
}
