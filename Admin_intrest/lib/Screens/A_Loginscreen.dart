import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intrest/Screens/ForgotPwdScreen.dart';

class A_Loginscreen extends StatefulWidget {
  const A_Loginscreen({super.key});

  @override
  State<A_Loginscreen> createState() => _A_LoginscreenState();
}

class _A_LoginscreenState extends State<A_Loginscreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  late AnimationController _animation;
  late Animation<double> _welcometextpos;
  late Animation<double> _adminLoginScreenOpacity;
  bool _ShowLoginScreen = false;
  bool ispwdvisible = false;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _welcometextpos = Tween<double>(begin: 0.5, end: -0.6).animate(
      CurvedAnimation(
        parent: _animation,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    _adminLoginScreenOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
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
    _emailController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  Future<void> _adminLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final email = _emailController.text.trim();
    final password = _pwdController.text.trim();

    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        Navigator.pushReplacementNamed(context, '/admin_dashboard');
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login failed: ${e.toString()}")));
    }
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
          AnimatedBuilder(
            animation: _welcometextpos,
            builder: (context, child) {
              return Align(
                alignment: Alignment(0, _welcometextpos.value),
                child: const Text(
                  'Welcome, Admin...!',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              );
            },
          ),

          if (_ShowLoginScreen)
            AnimatedBuilder(
              animation: _adminLoginScreenOpacity,
              builder: (context, child) {
                return Opacity(
                  opacity: _adminLoginScreenOpacity.value,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
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
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    labelText: "Email",
                                    border: OutlineInputBorder(),
                                  ),
                                  validator:
                                      (value) =>
                                          value!.isEmpty
                                              ? "Enter your email"
                                              : null,
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: _pwdController,
                                  obscureText: !ispwdvisible,
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    border: const OutlineInputBorder(),
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
                                  ),
                                  validator:
                                      (value) =>
                                          value!.isEmpty
                                              ? "Enter your password"
                                              : null,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => ForgotPwdScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text("Forgot Password?"),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: _adminLogin,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                    ),
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
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
                );
              },
            ),
        ],
      ),
    );
  }
}
