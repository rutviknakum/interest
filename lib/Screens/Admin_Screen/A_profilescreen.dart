import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class A_profilescreen extends StatefulWidget {
  const A_profilescreen({super.key});

  @override
  State<A_profilescreen> createState() => _A_profilescreenState();
}

class _A_profilescreenState extends State<A_profilescreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Make _email nullable to avoid errors
  String? _email;

  @override
  void initState() {
    super.initState();
    _fetchemail(); // Fetch email when the screen loads
  }

  // Fetch email from Firebase
  void _fetchemail() {
    User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        _email = user.email; // Set email if user is logged in
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile picture
            const CircleAvatar(
              radius: 100,
            ),
            const SizedBox(height: 20),

            // Display email
            _email != null
                ? Text(
                    _email!, // Show email if it's fetched
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  )
                : const CircularProgressIndicator(), //load lese jya sudhi email fetch na thay

            const SizedBox(height: 20),

            // Edit Profile button (Optional: Add functionality here)
            ElevatedButton(
              onPressed: () {
                // Add profile edit functionality here if needed
              },
              child: const Text(
                'Edit Profile',
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 20),

            // Logout button
          ],
        ),
      ),
    );
  }
}
