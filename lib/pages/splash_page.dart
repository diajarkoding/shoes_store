import 'dart:async';

import 'package:flutter/material.dart';
import 'package:toko_sepatu/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, '/login'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroudColor1,
      body: Center(
          child: Container(
        width: 130,
        height: 150,
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/image_splash.png'))),
      )),
    );
  }
}
