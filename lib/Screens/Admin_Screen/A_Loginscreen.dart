import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interest/Screens/Admin_Screen/A_mainscreen.dart';

import 'package:interest/Screens/Admin_Screen/ForgotPwdScreen.dart';
import 'package:interest/firebase_services/auth_service.dart';

class A_Loginscreen extends StatefulWidget {
  const A_Loginscreen({super.key});

  @override
  State<A_Loginscreen> createState() => _A_LoginscreenState();
}

class _A_LoginscreenState extends State<A_Loginscreen>
    with SingleTickerProviderStateMixin {
  final FirebaseServices _auth = FirebaseServices();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  late AnimationController _animation;
  late Animation<double> _welcometextpos;
  late Animation<double> _adminLoginScreenOpacity;
  bool _ShowLoginScreen = false;
  bool ispwdvisible = false;
  void _loginadmin() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String pwd = _pwdController.text.trim();
      User? user = await _auth.loginmethod(email, pwd);
      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login successful!")),
        );
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => A_mainscreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("Login failed. Please check your credentials.")),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _animation =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
//position of welcome text
    _welcometextpos = Tween<double>(begin: 0.5, end: -0.6).animate(
        CurvedAnimation(
            parent: _animation,
            curve: const Interval(0.0, 0.5, curve: Curves.easeInOut)));
    //opacity
    _adminLoginScreenOpacity = Tween<double>(
      begin: 0.0, // Fully transparent
      end: 1.0, // Fully visible
    ).animate(
      CurvedAnimation(
        parent: _animation,
        curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
      ),
    );

    _animation.forward();

    _animation.addListener(() {
      if (_animation.value > 0.2 && !_ShowLoginScreen) {
        setState(() {
          _ShowLoginScreen = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffa1c4fd), Color(0xffc2e9fb)],
              ),
            ),
          ),
          // Animated "Welcome" Text
          AnimatedBuilder(
            animation: _welcometextpos,
            builder: (context, child) {
              return Align(
                alignment: Alignment(0, _welcometextpos.value),
                child: const Text(
                  'Welcome, Admin...!',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              );
            },
          ),
          // Login Screen (Initially Invisible)
          if (_ShowLoginScreen)
            AnimatedBuilder(
              animation: _adminLoginScreenOpacity,
              builder: (context, child) {
                return Opacity(
                  opacity: _adminLoginScreenOpacity.value,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 95, left: 16, right: 16),
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.zero,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: SingleChildScrollView(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    'assets/images/Logo.png',
                                    height: 200,
                                    width: 200,
                                  ),
                                  const SizedBox(height: 16),
                                  TextFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      labelText: "Email",
                                      hintText: 'Enter Your Email...!',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter your email";
                                      }
                                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                          .hasMatch(value)) {
                                        return "Please enter a valid email";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    controller: _pwdController,
                                    obscureText: !ispwdvisible,
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                      hintText: 'Enter Your Password...!',
                                      //prefixIcon: const Icon(Icons.lock),
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
                                      border: const OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter your password";
                                      }
                                      if (value.length < 6) {
                                        return "Password must be at least 6 characters";
                                      }
                                      return null;
                                    },
                                  ),
                                  //  SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ForgotPwdScreen()));
                                          },
                                          style: TextButton.styleFrom(
                                            // foregroundColor: Colors.black,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero,
                                            ),
                                          ),
                                          child: const Text(
                                            "Forgot Password?!",
                                            style: TextStyle(
                                                // color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: TextButton(
                                      onPressed: _loginadmin,
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.black,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                        ),
                                      ),
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.login,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Login",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
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
              },
            ),
        ],
      ),
    );
  }
}
