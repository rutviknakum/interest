/*import 'package:flutter/material.dart';
import 'package:interest/Screens/Useer_Screen/U_verification_pwd.dart';
import 'package:interest/firebase_services/auth_service.dart';

class U_forgotpwd extends StatefulWidget {
  const U_forgotpwd({super.key});

  @override
  _U_forgotpwdState createState() => _U_forgotpwdState();
}

class _U_forgotpwdState extends State<U_forgotpwd> {
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
                builder: (context) => U_verificaion_pwd(
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
        decoration: const BoxDecoration(
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
                      const SizedBox(height: 20),
                      const Text(
                          "Please Enter Your Mobile Number or E-mail to Receive Verification Code"),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          hintText: "Enter Your Email...!",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero),
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("Or",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _phoneController,
                        decoration: const InputDecoration(
                          labelText: "Mobile Number",
                          hintText: "Enter Your Mobile Number...!",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero),
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                      const SizedBox(height: 20),
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
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child:
                            const Text("Send", style: TextStyle(fontSize: 20)),
                      ),
                      const SizedBox(height: 20),
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
*/
