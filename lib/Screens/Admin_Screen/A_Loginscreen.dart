import 'package:flutter/material.dart';

class A_Loginscreen extends StatefulWidget {
  const A_Loginscreen({super.key});

  @override
  State<A_Loginscreen> createState() => _A_LoginscreenState();
}

class _A_LoginscreenState extends State<A_Loginscreen>
    with SingleTickerProviderStateMixin {
  var emailController = TextEditingController();
  var pwdController = TextEditingController();
  late AnimationController _animation;
  late Animation<double> _welcometextpos;
  late Animation<double> _adminLoginScreenOpacity;
  bool _ShowLoginScreen = false;

  @override
  void initState() {
    super.initState();
    _animation =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
//position of welcome text
    _welcometextpos = Tween<double>(begin: 0.5, end: -0.6).animate(
        CurvedAnimation(
            parent: _animation,
            curve: Interval(0.0, 0.5, curve: Curves.easeInOut)));
    //opacity
    _adminLoginScreenOpacity = Tween<double>(
      begin: 0.0, // Fully transparent
      end: 1.0, // Fully visible
    ).animate(
      CurvedAnimation(
        parent: _animation,
        curve: Interval(0.4, 1.0, curve: Curves.easeIn),
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
            decoration: BoxDecoration(
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
                child: Text(
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
                        borderRadius: BorderRadius.circular(16),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/Logo.png',
                                height: 200,
                                width: 200,
                              ),
                              SizedBox(height: 16),
                              TextField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: "Username",
                                  hintText: 'Enter Your Username...!',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  hintText: 'Enter Your Password...!',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 30),
                              SizedBox(
                                width: 150,
                                height: 50,
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Row(
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
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Text(
                                        "Forgot Password?!",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              )
                            ],
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
