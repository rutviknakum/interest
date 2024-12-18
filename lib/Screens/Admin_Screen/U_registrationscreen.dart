import 'package:flutter/material.dart';

class U_registrationscreen extends StatefulWidget {
  const U_registrationscreen({super.key});

  @override
  _U_registrationscreenState createState() => _U_registrationscreenState();
}

class _U_registrationscreenState extends State<U_registrationscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _welcomeTextPosition;
  late Animation<double> _loginScreenOpacity;
  bool _showLoginScreen = false;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    // Define the animation for moving the "Welcome" text
    _welcomeTextPosition = Tween<double>(
      begin: 0.5, // Start in the middle (50% height)
      end: -0.6, // Move to the top
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    // Define the animation for fading in the login screen
    _loginScreenOpacity = Tween<double>(
      begin: 0.0, // Fully transparent
      end: 1.0, // Fully visible
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 1.0, curve: Curves.easeIn),
      ),
    );

    // Start the animation automatically when the screen opens
    _controller.forward();

    // Set a listener to show the login screen once "Welcome" finishes moving
    _controller.addListener(() {
      if (_controller.value > 0.2 && !_showLoginScreen) {
        setState(() {
          _showLoginScreen = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
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
            animation: _welcomeTextPosition,
            builder: (context, child) {
              return Align(
                alignment: Alignment(0, _welcomeTextPosition.value),
                child: Text(
                  'Welcome...!',
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
          if (_showLoginScreen)
            AnimatedBuilder(
              animation: _loginScreenOpacity,
              builder: (context, child) {
                return Opacity(
                  opacity: _loginScreenOpacity.value,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 75, left: 16, right: 16),
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
                                width: 150,
                              ),
                              SizedBox(height: 15),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: "Name",
                                  hintText: "Enter Your Name...!",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 15),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  hintText: "Enter Your Email...!",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 15),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: "Phone Number",
                                  hintText: "Enter Your PhoneNumber...!",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 15),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  hintText: 'Enter your Password...!',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 15),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Re-Type Password",
                                  hintText: "",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                width: 175,
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
                                      Icon(Icons.app_registration,
                                          size: 25, color: Colors.white),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Register",
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
                );
              },
            ),
        ],
      ),
    );
  }
}
