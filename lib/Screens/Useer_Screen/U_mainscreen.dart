import 'package:flutter/material.dart';

class U_mainscreen extends StatefulWidget {
  const U_mainscreen({super.key});

  @override
  State<U_mainscreen> createState() => _U_mainscreenState();
}

class _U_mainscreenState extends State<U_mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("welcome users")),
    );
  }
}
