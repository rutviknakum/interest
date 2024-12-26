/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interest/widget/LoginButton.dart';

class U_registration extends StatefulWidget {
  const U_registration({super.key});

  @override
  State<U_registration> createState() => _U_registrationState();
}

class _U_registrationState extends State<U_registration> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _pnoController = TextEditingController();

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
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: "Name",
                            hintText: "Enter Your Name...!",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "Enter Your Email...!",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: _pnoController,
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            hintText: "Enter Your PhoneNumber...!",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: _pwdController,
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
                          controller: _pwdController,
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
                            onPressed: () {
                              String name = _nameController.text;
                              String email = _emailController.text;
                              String phoneno = _pnoController.text;
                              String pwd = _pwdController.text;

                              User? user = _auth.
                            },
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
}*/
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:interest/Screens/Useer_Screen/U_Loginscreen.dart';
import 'package:interest/firebase_services/auth_service.dart';

class U_registration extends StatefulWidget {
  const U_registration({super.key});

  @override
  State<U_registration> createState() => _U_registrationState();
}

class _U_registrationState extends State<U_registration> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _retypePwdController = TextEditingController();
  final TextEditingController _pnoController = TextEditingController();
  bool ispwdvisible = false;

  final FirebaseServices _firebaseServices = FirebaseServices();
  final _formKey = GlobalKey<FormState>();

  void _registerUser() async {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text.trim();
      String email = _emailController.text.trim();
      String phoneno = _pnoController.text.trim();
      String password = _pwdController.text.trim();

      User? user =
          await _firebaseServices.Usigninmethod(name, email, phoneno, password);
      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Registration successful!")));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  U_Loginscreen()), // Replace HomePage with your destination widget
        );
        // Navigate to another screen or clear form fields
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("Registration failed. Please try again.")),
        );
      }
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
            padding: const EdgeInsets.all(8),
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
                          height: 150,
                          width: 150,
                        ),
                        const SizedBox(height: 15),
                        // Name Field
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: "Name",
                            hintText: "Enter Your Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your name";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        // Email Field
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: "Email",
                            hintText: "Enter Your Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero),
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
                        const SizedBox(height: 15),
                        // Phone Number Field
                        TextFormField(
                          controller: _pnoController,
                          decoration: const InputDecoration(
                            labelText: "Phone Number",
                            hintText: "Enter Your Phone Number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your phone number";
                            }
                            if (!RegExp(r'^\d{10,}$').hasMatch(value)) {
                              return "Please enter a valid phone number";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        // Password Field
                        TextFormField(
                          controller: _pwdController,
                          obscureText: !ispwdvisible,
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Enter Your Password",
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
                        const SizedBox(height: 15),
                        // Retype Password Field
                        TextFormField(
                          controller: _retypePwdController,
                          obscureText: !ispwdvisible,
                          decoration: InputDecoration(
                            labelText: "Re-Type Password",
                            hintText: "Enter Your Password Again",
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
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please retype your password";
                            }
                            if (value != _pwdController.text) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Register Button
                        SizedBox(
                          width: 175,
                          height: 50,
                          child: TextButton(
                            onPressed: _registerUser,
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.app_registration,
                                    size: 25, color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
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
      ),
    );
  }
}
