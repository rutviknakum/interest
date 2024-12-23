import 'package:flutter/material.dart';
import 'package:interest/Screens/Admin_Screen/A_verification_pwd.dart';

class ForgotPwdScreen extends StatelessWidget {
  const ForgotPwdScreen({super.key});

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
                      SizedBox(height: 20),
                      Text(
                          "Please Enter Your Mobile Number or e-mail to Receive verification code"),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Enter Your Email...!",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                      ),
                      SizedBox(height: 11),
                      Text("Or"),
                      SizedBox(height: 11),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Mobile Number",
                          hintText: "Enter Your Mobile Number...!",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => A_verificaion_pwd()));
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              )),
                          child: Text(
                            "Send",
                            style: TextStyle(fontSize: 20),
                          ))
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
