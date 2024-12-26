import 'package:flutter/material.dart';
import 'package:interest/firebase_services/auth_service.dart';

class U_pwdscreen extends StatefulWidget {
  const U_pwdscreen({super.key});

  @override
  State<U_pwdscreen> createState() => _U_pwdscreenState();
}

class _U_pwdscreenState extends State<U_pwdscreen> {
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
}
