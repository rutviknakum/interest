/*import 'package:flutter/material.dart';
import 'package:interest/firebase_services/auth_service.dart';

class A_pwdscreen extends StatefulWidget {
  const A_pwdscreen({super.key});

  @override
  State<A_pwdscreen> createState() => _A_pwdscreenState();
}

class _A_pwdscreenState extends State<A_pwdscreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FirebaseServices _auth = FirebaseServices();
  String _message = "";
  bool ispwdvisible = false;

  void _updatePassword() async {
    if (_newPasswordController.text == _confirmPasswordController.text) {
      String? result = await _auth.upadatePassword(_newPasswordController.text);
      setState(() {
        _message = result ?? "Error occurred.";
      });
    } else {
      setState(() {
        _message = "Passwords do not match!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xffa1c4fd), Color(0xffc2e9fb)],
      )),
      child: Opacity(
        opacity: 1,
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 95, left: 16, right: 16),
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.zero,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/Logo.png',
                        height: 150,
                        width: 150,
                      ),
                      const SizedBox(height: 11),
                      TextField(
                        controller: _newPasswordController,
                        obscureText: !ispwdvisible,
                        decoration: InputDecoration(
                          labelText: "New Password",
                          hintText: "Enter New Password...!",
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  ispwdvisible = !ispwdvisible;
                                });
                              },
                              icon: Icon(
                                ispwdvisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              )),
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.zero),
                          prefixIcon: const Icon(Icons.password),
                        ),
                      ),
                      const SizedBox(height: 11),
                      TextField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Confirm Password",
                          hintText: "Enter Confirm Password...!",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero),
                          prefixIcon: Icon(Icons.password),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: _updatePassword,
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              )),
                          child: const Text(
                            "Submit",
                            style: TextStyle(fontSize: 20),
                          )),
                      const SizedBox(height: 20),
                      Text(_message),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}*/

import 'package:flutter/material.dart';

class A_pwdscreen extends StatefulWidget {
  const A_pwdscreen({super.key});

  @override
  _A_pwdscreenState createState() => _A_pwdscreenState();
}

class _A_pwdscreenState extends State<A_pwdscreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String _message = "";

  void _resetPassword() {
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _message = "Passwords do not match!";
      });
      return;
    }

    if (_passwordController.text.isEmpty) {
      setState(() {
        _message = "Password cannot be empty!";
      });
      return;
    }

    // Call reset password API here with the new password
    setState(() {
      _message = "Password has been successfully reset!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffa1c4fd), Color(0xffc2e9fb)],
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 95, left: 16, right: 16),
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.zero,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/Logo.png',
                        height: 150,
                        width: 150,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                          "Enter a new password to reset your account's password."),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          hintText: "Enter new password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Confirm Password",
                          hintText: "Confirm new password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: _resetPassword,
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: const Text(
                          "Reset Password",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(_message),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
