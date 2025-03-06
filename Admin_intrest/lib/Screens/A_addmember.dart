import 'package:flutter/material.dart';

class A_addmember extends StatefulWidget {
  const A_addmember({super.key});

  @override
  State<A_addmember> createState() => _A_addmemberState();
}

class _A_addmemberState extends State<A_addmember> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, String>> _members = []; // Member list

  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _pnoController = TextEditingController();
  bool ispwdvisible = false;

  // Function to add a member and navigate
  void _addMember() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _members.add({
          "fname": _fnameController.text,
          "lname": _lnameController.text,
          "email": _emailController.text,
          "phone": _pnoController.text,
        });
      });

      // Clear input fields
      _fnameController.clear();
      _lnameController.clear();
      _emailController.clear();
      _pnoController.clear();
      _pwdController.clear();

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Member Added Successfully!"),
          backgroundColor: Colors.green,
        ),
      );
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

                        // First Name Field
                        TextFormField(
                          controller: _fnameController,
                          decoration: const InputDecoration(
                            labelText: "First Name",
                            hintText: "Enter Your First Name",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "First Name is required";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),

                        // Last Name Field
                        TextFormField(
                          controller: _lnameController,
                          decoration: const InputDecoration(
                            labelText: "Last Name",
                            hintText: "Enter Your Last Name",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Last Name is required";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),

                        // Email Field
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: "Email",
                            hintText: "Enter Your Email",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Email is required";
                            }
                            if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                            ).hasMatch(value)) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),

                        // Phone Number Field
                        TextFormField(
                          controller: _pnoController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            labelText: "Phone Number",
                            hintText: "Enter Your Phone Number",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Phone Number is required";
                            }
                            if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                              return "Enter a valid 10-digit phone number";
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
                              ),
                            ),
                            border: const OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Password is required";
                            }
                            if (value.length < 6) {
                              return "Password must be at least 6 characters long";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),

                        // Register Button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: TextButton(
                            onPressed: _addMember,
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                              shape: const RoundedRectangleBorder(),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.app_registration,
                                  size: 25,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Add member",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),
                        // View Members Button
                        // SizedBox(
                        //   width: double.infinity,
                        //   height: 50,
                        //   child: TextButton(
                        //     onPressed: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder:
                        //               (context) =>
                        //                   MemberScreen(members: _members),
                        //         ),
                        //       );
                        //     },
                        //     style: TextButton.styleFrom(
                        //       foregroundColor: Colors.white,
                        //       backgroundColor: Colors.blue,
                        //       shape: const RoundedRectangleBorder(),
                        //     ),
                        //     child: const Text(
                        //       "View Members",
                        //       style: TextStyle(
                        //         fontSize: 18,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
