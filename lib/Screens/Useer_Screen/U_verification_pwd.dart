/*import 'package:flutter/material.dart';
import 'package:interest/Screens/Useer_Screen/U_pwdscreen.dart';
import 'package:interest/firebase_services/auth_service.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class U_verificaion_pwd extends StatefulWidget {
  final String verificationid;
  const U_verificaion_pwd({super.key, required this.verificationid});

  @override
  State<U_verificaion_pwd> createState() => _U_verificaion_pwdState();
}

class _U_verificaion_pwdState extends State<U_verificaion_pwd> {
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
          context, MaterialPageRoute(builder: (context) => U_pwdscreen()));
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
