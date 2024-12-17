import 'package:flutter/material.dart';
import 'package:interest/admin.dart';
import 'package:interest/widget/CustomButton.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            CustomButton(
              text: 'admin',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => adminScreen()));
              },
            ),
          ],
        ),
      ),
      /*body: Container(
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
                      style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                    ),
                  ),
                  Text(
                    "Admin",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(width: 50),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 200,
                    child: IconButton(
                      icon: Icon(
                        Icons.account_circle_sharp,
                        size: 30,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                //builder: (context) => AnimatedWelcomeScreen()));*/
                      },
                      style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                    ),
                  ),
                  Text(
                    "User",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),*/
    );
  }
}
