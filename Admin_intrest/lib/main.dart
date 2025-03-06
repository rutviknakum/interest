import 'package:flutter/material.dart';
import 'package:intrest/Screens/A_mainscreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: A_mainscreen());
  }
}
