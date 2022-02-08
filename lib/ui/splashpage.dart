import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testbank/constant.dart';
import 'package:testbank/ui/homepage.dart';
import 'package:testbank/ui/loginpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const double _splashIconSize = 200;
  @override
  void initState() {
    scheduleMicrotask(() async {
      await Future.delayed(Duration(milliseconds: 800));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.grey,
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.grey.withOpacity(.4),
                  radius: 100,
                  child: ClipOval(
                      child: Image.asset(
                    "assets/logo.png",
                    height: 100,
                    fit: BoxFit.contain,
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
