import 'package:flutter/material.dart';

class A_addmember extends StatefulWidget {
  const A_addmember({super.key});

  @override
  State<A_addmember> createState() => _A_addmemberState();
}

class _A_addmemberState extends State<A_addmember> {
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _pnoController = TextEditingController();
  bool ispwdvisible = false;

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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/Logo.png',
                        height: 150,
                        width: 150,
                      ),
                      const SizedBox(height: 15),
                      // First Name Field
                      TextField(
                        controller: _fnameController,
                        decoration: const InputDecoration(
                          labelText: "First Name",
                          hintText: "Enter Your First Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Last Name Field
                      TextField(
                        controller: _lnameController,
                        decoration: const InputDecoration(
                          labelText: "Last Name",
                          hintText: "Enter Your Last Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Email Field
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          hintText: "Enter Your Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Phone Number Field
                      TextField(
                        controller: _pnoController,
                        decoration: const InputDecoration(
                          labelText: "Phone Number",
                          hintText: "Enter Your Phone Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Password Field
                      TextField(
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
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Register Button
                      SizedBox(
                        width: 175,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            // Placeholder for action
                          },
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
                                "Add member",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
    );
  }
}
