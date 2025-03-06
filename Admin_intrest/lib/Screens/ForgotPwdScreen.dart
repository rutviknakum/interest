import 'package:flutter/material.dart';

class ForgotPwdScreen extends StatefulWidget {
  const ForgotPwdScreen({super.key});

  @override
  _ForgotPwdScreenState createState() => _ForgotPwdScreenState();
}

class _ForgotPwdScreenState extends State<ForgotPwdScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _message = "";
  final bool _isLoading = false;

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
                            borderRadius: BorderRadius.zero,
                          ),
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Or",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _phoneController,
                        decoration: const InputDecoration(
                          labelText: "Mobile Number",
                          hintText: "Enter Your Mobile Number...!",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          if (_emailController.text.isNotEmpty) {
                          } else {
                            setState(() {
                              _message =
                                  "Please enter either email or phone number.";
                            });
                          }
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text("Send",
                                style: TextStyle(fontSize: 20)),
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
