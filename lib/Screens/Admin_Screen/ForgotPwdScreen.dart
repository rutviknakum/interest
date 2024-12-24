import 'package:flutter/material.dart';
import 'package:interest/Screens/Admin_Screen/A_verification_pwd.dart';
import 'package:interest/firebase_services/auth_service.dart';

class ForgotPwdScreen extends StatefulWidget {
  const ForgotPwdScreen({super.key});

  @override
  _ForgotPwdScreenState createState() => _ForgotPwdScreenState();
}

class _ForgotPwdScreenState extends State<ForgotPwdScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final FirebaseServices _auth = FirebaseServices();
  String _message = "";

  // Send reset email
  void _sendResetEmail() async {
    String? result = await _auth.resetpwd(_emailController.text);
    setState(() {
      _message = result ?? "Error occurred.";
    });
  }

  // Send reset phone
  void _sendResetPhone() async {
    await _auth.sendPhoneVerification(
      _phoneController.text,
      (message) {
        setState(() {
          _message = message;
        });
      },
      (verificationid, resendToken) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => A_verificaion_pwd(
                      verificationid: verificationid,
                    )));
      },
      (errorMessage) {
        setState(() {
          _message = errorMessage;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffa1c4fd), Color(0xffc2e9fb)],
          ),
        ),
        child: Center(
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
                          "Please Enter Your Mobile Number or E-mail to Receive Verification Code"),
                      SizedBox(height: 20),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Enter Your Email...!",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero),
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("Or",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      TextField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: "Mobile Number",
                          hintText: "Enter Your Mobile Number...!",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero),
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          if (_emailController.text.isNotEmpty) {
                            _sendResetEmail();
                          } else if (_phoneController.text.isNotEmpty) {
                            _sendResetPhone();
                          }
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Text("Send", style: TextStyle(fontSize: 20)),
                      ),
                      SizedBox(height: 20),
                      Text(_message), // Display any messages
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
