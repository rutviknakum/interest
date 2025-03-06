import 'package:flutter/material.dart';
import 'package:intrest/Screens/A_Loginscreen.dart';
import 'package:intrest/Screens/A_addmember.dart';
import 'package:intrest/Screens/A_profilescreen.dart';
import 'package:intrest/Screens/MemberScreen.dart';

class A_mainscreen extends StatefulWidget {
  const A_mainscreen({super.key});

  @override
  State<A_mainscreen> createState() => _A_mainscreenState();
}

class _A_mainscreenState extends State<A_mainscreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isdarktheme = false;

  // void _toggletheme(bool value) {
  //   setState(() {
  //     _isdarktheme = value;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: _isdarktheme ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(),
                child: Column(
                  children: [
                    Icon(Icons.account_circle, size: 50, color: Colors.black),
                    SizedBox(height: 10),
                    Text(
                      "Welcome,Admin",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_box_rounded),
                title: Text("Profile"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => A_profilescreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {},
              ),
              // ListTile(
              //   leading: Icon(Icons.dark_mode),
              //   title: Text("dark mode"),
              //   trailing: Switch(value: _isdarktheme, onChanged: _toggletheme),
              //   onTap: () {},
              // ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Log Out"),
                onTap: () async {
                  bool? confirmLogout = await showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: Text("Confirm Logout"),
                          content: Text("Are you sure you want to log out?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, false); // Cancel logout
                              },
                              child: Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, true); // Confirm logout
                              },
                              child: Text("Log Out"),
                            ),
                          ],
                        ),
                  );

                  if (confirmLogout == true) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => A_Loginscreen()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffa1c4fd), Color(0xffc2e9fb)],
            ),
          ),
          child: Column(
            children: [
              // Add space at the top
              const SizedBox(height: 50), // Adjust height as needed
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // "Welcome Admin" Text
                    const Text(
                      "Welcome Admin...!",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    // Profile Icon
                    IconButton(
                      onPressed: () {
                        // Add navigation or functionality for profile here
                        _scaffoldKey.currentState?.openEndDrawer();
                      },
                      icon: const Icon(Icons.account_circle, size: 40),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 250.0, bottom: 50),
                child: Container(
                  width: 80, // Set the width of the square
                  height: 80, // Set the height of the square
                  decoration: BoxDecoration(
                    // color: Colors.grey.shade200, // Set background color
                    shape:
                        BoxShape
                            .rectangle, // Ensure it's a rectangle (square here)
                    // Optional: Rounded corners
                    // Optional: Border styling
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => A_addmember()),
                      );
                    },
                    icon: Icon(
                      Icons.add,
                      size: 80, // Adjust icon size as needed
                      color: Colors.black, // Adjust icon color
                    ),
                  ),
                ),
              ),
              // Pushes content below this to the bottom
            ],
          ),
        ),
        //bottom mate na 3 button
        bottomNavigationBar: BottomAppBar(
          // color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => A_mainscreen()),
                  // );
                },
                icon: Icon(Icons.home),
                iconSize: 30,
                color: Colors.black,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MemberScreen(members: []),
                    ),
                  );
                },
                icon: Icon(Icons.people),
                iconSize: 30,
                color: Colors.black,
              ),
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(Icons.home),
              //   iconSize: 30,
              //   color: Colors.black,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
