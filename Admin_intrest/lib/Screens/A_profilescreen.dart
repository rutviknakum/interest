import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class A_profilescreen extends StatefulWidget {
  const A_profilescreen({super.key});

  @override
  State<A_profilescreen> createState() => _A_profilescreenState();
}

class _A_profilescreenState extends State<A_profilescreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  File? _profilePic;
  bool _isEditing = false;

  // Pick profile picture from gallery or camera
  Future<void> _pickProfilePic() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    ); // Use ImageSource.camera for camera
    if (pickedFile != null) {
      setState(() {
        _profilePic = File(pickedFile.path);
      });
    }
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
      appBar: AppBar(title: const Text("Profile Screen")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Picture
            GestureDetector(
              onTap: _isEditing ? _pickProfilePic : null,
              child: CircleAvatar(
                radius: 100,
                backgroundImage:
                    _profilePic != null
                        ? FileImage(_profilePic!)
                        : const AssetImage('assets/images/default_profile.png')
                            as ImageProvider,
                child:
                    _isEditing
                        ? const Icon(Icons.camera_alt, color: Colors.white)
                        : Container(),
              ),
            ),
            const SizedBox(height: 20),

            // Editable Fields (only in editing mode)
            if (_isEditing) ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(labelText: 'First Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(labelText: 'Last Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: _phoneNumberController,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Show success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Profile updated successfully!"),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    ),
                  );

                  // Toggle edit mode
                  _toggleEdit();
                },
                child: const Text("Update Profile"),
              ),
            ] else ...[
              // Display name and phone when not editing
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    const Text("First Name: ", style: TextStyle(fontSize: 18)),
                    Text(
                      _firstNameController.text,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    const Text("Last Name: ", style: TextStyle(fontSize: 18)),
                    Text(
                      _lastNameController.text,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    const Text(
                      "Phone Number: ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      _phoneNumberController.text,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _toggleEdit,
                child: const Text("Edit Profile"),
              ),
            ],

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
