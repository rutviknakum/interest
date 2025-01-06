/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interest/Screens/Admin_Screen/A_profilescreen.dart';
import 'package:interest/Screens/Useer_Screen/U_Loginscreen.dart';
import 'package:interest/firebase_services/auth_service.dart';

class U_mainscreen extends StatefulWidget {
  const U_mainscreen({super.key});

  @override
  State<U_mainscreen> createState() => _U_mainscreenState();
}

class _U_mainscreenState extends State<U_mainscreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseServices _firebaseServices = FirebaseServices();
  String? firstName;

  @override
  void initState() {
    super.initState();
    _fetchFirstName();
  }

  Future<void> _fetchFirstName() async {
    final userDetails = await _firebaseServices.fetchUserDetails();
    if (userDetails != null) {
      setState(() {
        firstName = userDetails['firstname'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(),
                child: Column(
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 50,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      firstName != null
                          ? "Welcome, $firstName"
                          : "Welcome, User",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            ListTile(
              leading: Icon(Icons.account_box_rounded),
              title: Text("Profile"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => A_profilescreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log Out"),
              onTap: () async {
                await _auth.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (Context) => U_Loginscreen()));
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
                    "Welcome User...!",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
          ],
        ),
      ),
    );
  }
}
*/
