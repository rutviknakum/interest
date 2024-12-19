import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interest/DashboardScreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DashboardScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //backgroundColor: Colors.deepPurpleAccent.shade100,
          ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 3),
            curve: Curves.fastLinearToSlowEaseIn,
          ),
          Center(
            child: Image.asset(
              'assets/images/Splash.png',
              height: 200,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
