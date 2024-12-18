import 'package:flutter/material.dart';

class AnimatedWelcomeScreen extends StatefulWidget {
  const AnimatedWelcomeScreen({super.key});

  @override
  _AnimatedWelcomeScreenState createState() => _AnimatedWelcomeScreenState();
}

class _AnimatedWelcomeScreenState extends State<AnimatedWelcomeScreen>
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
      end: -0.8, // Move to the top
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
        curve: Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );

    // Start the animation automatically when the screen opens
    _controller.forward();

    // Set a listener to show the login screen once "Welcome" finishes moving
    _controller.addListener(() {
      if (_controller.value > 0.5 && !_showLoginScreen) {
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
          // Animated "Welcome" Text
          AnimatedBuilder(
            animation: _welcomeTextPosition,
            builder: (context, child) {
              return Align(
                alignment: Alignment(0, _welcomeTextPosition.value),
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
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
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(16),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  labelText: "Username",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 16),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 24),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("Login"),
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
