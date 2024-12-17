import 'package:flutter/material.dart';

class adminScreen extends StatefulWidget {
  const adminScreen({super.key});

  @override
  State<adminScreen> createState() => _adminScreenState();
}

class _adminScreenState extends State<adminScreen> {
  var emailController = TextEditingController();
  var pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'enter email',
                prefixIcon: Icon(Icons.login_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 11,
          ),
          Center(
            child: TextField(
              controller: pwdController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'enter password',
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 11,
          ),
          ElevatedButton(onPressed: () {}, child: Text("Login")),
        ],
      ),
    );
  }
}
