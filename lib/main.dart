import 'package:flutter/material.dart';
import 'package:interest/admin.dart';
import 'package:interest/splashscreen.dart';

void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xffa1c4fd), Color(0xffc2e9fb)],
        )),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 200,
                    child: IconButton(
                      icon: Icon(
                        Icons.admin_panel_settings,
                        size: 30,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => adminScreen()));
                      },
                    ),
                  ),
                  Text(
                    "Admin",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(width: 50),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 110,
                    height: 100,
                    child: IconButton(
                      icon: Icon(
                        Icons.account_circle_sharp,
                        size: 30,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // Add User button action
                      },
                    ),
                  ),
                  Text(
                    "User",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
