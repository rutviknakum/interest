/*import 'package:firebase_auth/firebase_auth.dart';
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
            ElevatedButton(
              onPressed: () async {
                await _auth.signOut(); // Log out the user
                // Optionally, navigate to the login screen after logout
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Red color for logout button
              ),
              child: const Text(
                'Logout',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class A_profilescreen extends StatefulWidget {
  const A_profilescreen({super.key});

  @override
  State<A_profilescreen> createState() => _A_profilescreenState();
}

class _A_profilescreenState extends State<A_profilescreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  String? _email, _firstName, _lastName, _phoneNumber, _profilePicUrl;
  bool _isEditing = false;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  File? _profilePic;

  @override
  void initState() {
    super.initState();
    _fetchAdminDetails(); // Fetch admin details when the screen loads
  }

  // Fetch admin details (email, name, phone, and profile pic)
  void _fetchAdminDetails() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        bool isAdmin = userDoc['isAdmin'] ?? false; // Check if user is admin
        if (isAdmin) {
          setState(() {
            _email = user.email;
            _firstName = userDoc['firstName'];
            _lastName = userDoc['lastName'];
            _phoneNumber = userDoc['phoneNumber'];
            _profilePicUrl = userDoc['profilePicUrl'];
            _firstNameController.text = _firstName ?? '';
            _lastNameController.text = _lastName ?? '';
            _phoneNumberController.text = _phoneNumber ?? '';
          });
        } else {
          setState(() {
            _email = null; // Reset if the user is not an admin
          });
        }
      } else {
        setState(() {
          _email = null; // Reset if user document doesn't exist
        });
      }
    }
  }

  // Pick profile picture from gallery or camera
  Future<void> _pickProfilePic() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource
            .gallery); // You can switch to ImageSource.camera for camera
    if (pickedFile != null) {
      setState(() {
        _profilePic = File(pickedFile.path);
      });
    }
  }

  // Save the updated profile details
  Future<void> _saveProfile() async {
    if (_profilePic != null) {
      // Upload the profile picture to Firebase Storage
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      UploadTask uploadTask =
          _storage.ref().child('profile_pics/$fileName').putFile(_profilePic!);
      TaskSnapshot snapshot = await uploadTask;
      String profilePicUrl = await snapshot.ref.getDownloadURL();

      // Save the updated details to Firestore
      await _firestore.collection('users').doc(_auth.currentUser?.uid).update({
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'phoneNumber': _phoneNumberController.text,
        'profilePicUrl': profilePicUrl,
      });
    } else {
      // If no new profile picture is selected, just update text details
      await _firestore.collection('users').doc(_auth.currentUser?.uid).update({
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'phoneNumber': _phoneNumberController.text,
      });
    }
    setState(() {
      _isEditing = false;
    });
    // Re-fetch details after saving
    _fetchAdminDetails();
  }

  // Toggle edit mode
  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
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
            // Profile Picture
            GestureDetector(
              onTap: _isEditing ? _pickProfilePic : null,
              child: CircleAvatar(
                radius: 100,
                backgroundImage: _profilePic != null
                    ? FileImage(_profilePic!)
                    : (_profilePicUrl != null
                            ? NetworkImage(_profilePicUrl!)
                            : const AssetImage(
                                'assets/images/default_profile.png'))
                        as ImageProvider,
                child: _isEditing
                    ? const Icon(Icons.camera_alt, color: Colors.white)
                    : Container(),
              ),
            ),
            const SizedBox(height: 20),

            // Admin Email (not editable)
            _email != null
                ? Text(
                    _email!,
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  )
                : const Text(
                    "You are not an admin.",
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
            const SizedBox(height: 20),

            // Editable Fields (only in editing mode)
            if (_isEditing) ...[
              TextField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
              TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
              TextField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProfile,
                child: const Text("Save Profile"),
              ),
            ] else ...[
              // Display name and phone when not editing
              Text("First Name: $_firstName"),
              Text("Last Name: $_lastName"),
              Text("Phone Number: $_phoneNumber"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _toggleEdit,
                child: const Text("Edit Profile"),
              ),
            ],

            const SizedBox(height: 20),

            // Logout button
            ElevatedButton(
              onPressed: () async {
                await _auth.signOut();
                // Optionally, navigate to the login screen after logout
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Red color for logout button
              ),
              child: const Text(
                'Logout',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
