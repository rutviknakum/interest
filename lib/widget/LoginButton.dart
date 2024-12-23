import 'package:flutter/material.dart';

Widget googleLoginButton() {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton.icon(
      onPressed: () {},
      icon: Image.asset(
        'assets/images/google.png',
        fit: BoxFit.contain, // Add Google logo here
        height: 50,
        // width: 30,
      ),
      label: Text('Login with Google',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Colors.grey),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
    ),
  );
}

Widget appleLoginButton() {
  return SizedBox(
    width: double.infinity,
    height: 50,
    child: ElevatedButton.icon(
      onPressed: () {},
      icon: Image.asset(
        'assets/images/apple.png',
        fit: BoxFit.contain,
        height: 50,
        // width: 30,
      ),
      label: Text(
        'Login with Apple',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Colors.grey),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
    ),
  );
}
