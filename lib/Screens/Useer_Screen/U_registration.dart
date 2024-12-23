import 'package:flutter/material.dart';
import 'package:interest/widget/LoginButton.dart';

class U_registration extends StatelessWidget {
  const U_registration({super.key});

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
              padding: const EdgeInsets.all(8),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.zero,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/Logo.png',
                          height: 150,
                          width: 150,
                        ),
                        SizedBox(height: 15),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Name",
                            hintText: "Enter Your Name...!",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Enter Your Email...!",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            hintText: "Enter Your PhoneNumber...!",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: 'Enter your Password...!',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Re-Type Password...!",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: 175,
                          height: 50,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.app_registration,
                                    size: 25, color: Colors.white),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        googleLoginButton(),
                        SizedBox(
                          height: 10,
                        ),
                        appleLoginButton()

                        /*
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                child: Text(
                                  "Continue With Apple",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                child: Text(
                                  "Continue With Google",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        )
                        */
                      ],
                    ),
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
