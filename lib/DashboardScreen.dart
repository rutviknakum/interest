import 'package:flutter/material.dart';
import 'package:interest/Screens/Admin_Screen/A_Loginscreen.dart';
import 'package:interest/Screens/Useer_Screen/U_Loginscreen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*body: Center(
        child: CustomSquareButton(
          icon: Icons.admin_panel_settings,
          text: 'Admin',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => A_Loginscreen()));
          },
        ),
      ),*/
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
                    width: 150,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => A_Loginscreen()));
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      )),
                      child: Row(
                        children: [
                          Icon(
                            Icons.admin_panel_settings,
                            size: 45,
                            color: Colors.black,
                          ),
                          SizedBox(
                              //  width: 10,
                              ),
                          Text(
                            "Admin",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 50,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => U_Loginscreen()));
                },
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_box_rounded,
                      size: 45,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'User',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
