/*import 'package:flutter/material.dart';
import 'package:interest/Screens/Admin_Screen/A_pwdscreen.dart';
import 'package:interest/firebase_services/auth_service.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class A_verificaion_pwd extends StatefulWidget {
  final String verificationid;
  const A_verificaion_pwd({super.key, required this.verificationid});

  @override
  State<A_verificaion_pwd> createState() => _A_verificaion_pwdState();
}

class _A_verificaion_pwdState extends State<A_verificaion_pwd> {
  final TextEditingController _otpController = TextEditingController();
  final FirebaseServices _auth = FirebaseServices();
  String _message = "";
  void _verifyotp() async {
    String? result =
        await _auth.verifyPhoneOtp(widget.verificationid, _otpController.text);
    setState(() {
      _message = result ?? "errorr...!";
    });
    if (_message == "Phone Verification Successfull...!") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => A_pwdscreen()));
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
                      const Text(
                          "please enter verification code we will send you to email or phone number"),
                      const SizedBox(
                        height: 12,
                      ),
                      PinCodeTextField(
                        appContext: context,
                        length: 6,
                        controller: _otpController,
                        keyboardType: TextInputType.number,
                        enableActiveFill: false,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.zero,
                          fieldHeight: 10,
                          fieldWidth: 10,
                          activeFillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          TextButton(
                              onPressed: _verifyotp,
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.black,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  )),
                              child: const Text(
                                "Verify",
                                style: TextStyle(fontSize: 20),
                              )),
                          const Spacer(), //space apva mate use thay basically row nd column or center widget sathe,sizebox ni jgya e pn use kri skiea,eni roperty filx hoi apdne ketli space joie ena mate
                          Center(
                            child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    )),
                                child: const Text("resend code",
                                    style: TextStyle(fontSize: 20))),
                          )
                        ],
                      ),
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
*/
/*import 'package:flutter/material.dart';
import 'package:interest/Screens/Admin_Screen/A_pwdscreen.dart';
import 'package:interest/firebase_services/auth_service.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class A_verificaion_pwd extends StatefulWidget {
  final String verificationId;
  const A_verificaion_pwd({super.key, required this.verificationId});

  @override
  State<A_verificaion_pwd> createState() => _A_verificaion_pwdState();
}

class _A_verificaion_pwdState extends State<A_verificaion_pwd> {
  final TextEditingController _otpController = TextEditingController();
  final FirebaseServices _auth = FirebaseServices();
  String _message = "";

  void _verifyOtp() async {
    String? result =
        await _auth.verifyPhoneOtp(widget.verificationId, _otpController.text);
    setState(() {
      _message = result ?? "Error occurred!";
    });
    if (_message == "Phone Verification Successful!") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => A_pwdscreen()));
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
                      const Text(
                        "Please enter the verification code we sent to your email or phone number.",
                      ),
                      const SizedBox(height: 12),
                      PinCodeTextField(
                        appContext: context,
                        length: 6,
                        controller: _otpController,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.zero,
                          fieldHeight: 10,
                          fieldWidth: 10,
                          activeFillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          TextButton(
                            onPressed: _verifyOtp,
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: const Text("Verify",
                                style: TextStyle(fontSize: 20)),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              // Implement resend code functionality
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: const Text("Resend Code",
                                style: TextStyle(fontSize: 20)),
                          ),
                        ],
                      ),
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
import 'package:flutter/material.dart';
import 'package:interest/Screens/Admin_Screen/A_pwdscreen.dart';
import 'package:interest/firebase_services/auth_service.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class A_verificaion_pwd extends StatefulWidget {
  final String verificationId;
  const A_verificaion_pwd({super.key, required this.verificationId});

  @override
  State<A_verificaion_pwd> createState() => _A_verificaion_pwdState();
}

class _A_verificaion_pwdState extends State<A_verificaion_pwd> {
  final TextEditingController _otpController = TextEditingController();
  final FirebaseServices _auth = FirebaseServices();
  String _message = "";
  bool _isLoading = false;

  // Verify OTP
  void _verifyOtp() async {
    if (_otpController.text.isEmpty || _otpController.text.length < 6) {
      setState(() {
        _message = "Please enter a valid OTP.";
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    String? result =
        await _auth.verifyPhoneOtp(widget.verificationId, _otpController.text);

    setState(() {
      _isLoading = false;
      _message = result ?? "Error occurred!";
    });

    if (_message == "Phone Verification Successful!") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => A_pwdscreen()),
      );
    } else {
      // Show error message using a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_message),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Resend OTP functionality
  void _resendCode() async {
    setState(() {
      _isLoading = true;
    });

    String? result =
        await _auth.sendPhoneVerificationAgain(widget.verificationId);

    setState(() {
      _isLoading = false;
      _message = result ?? "Failed to resend OTP!";
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_message),
        backgroundColor: result != null ? Colors.green : Colors.red,
      ),
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
                      const Text(
                        "Please enter the verification code we sent to your email or phone number.",
                      ),
                      const SizedBox(height: 12),
                      PinCodeTextField(
                        appContext: context,
                        length: 6,
                        controller: _otpController,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.zero,
                          fieldHeight: 10,
                          fieldWidth: 10,
                          activeFillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          TextButton(
                            onPressed: _isLoading ? null : _verifyOtp,
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
                                : const Text("Verify OTP"),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            onPressed: _isLoading ? null : _resendCode,
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
                                : const Text("Resend OTP"),
                          ),
                        ],
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
*/
