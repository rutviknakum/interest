import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  String? _profilePicUrl;
  bool _isEditing = false;

  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    _fetchProfileData();
  }

  // Fetch user profile data from Supabase
  Future<void> _fetchProfileData() async {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    final response =
        await supabase.from('profiles').select().eq('id', user.id).single();

    setState(() {
      _firstNameController.text = response['first_name'] ?? '';
      _lastNameController.text = response['last_name'] ?? '';
      _phoneNumberController.text = response['mobile_number'] ?? '';
      _profilePicUrl = response['profile_photo'];
    });
  }

  // Pick profile picture from gallery
  Future<void> _pickProfilePic() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _profilePic = File(pickedFile.path);
      });
    }
  }

  // Upload image to Supabase Storage
  Future<String?> _uploadProfilePic(File imageFile) async {
    final user = supabase.auth.currentUser;
    if (user == null) return null;

    final fileName = '${user.id}.jpg';
    final fileBytes = await imageFile.readAsBytes();

    final response = await supabase.storage
        .from('profile_photos')
        .uploadBinary(
          fileName,
          fileBytes,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: true),
        );

    if (response.error == null) {
      return supabase.storage.from('profile_photos').getPublicUrl(fileName);
    }
    return null;
  }

  // Save profile data to Supabase
  Future<void> _saveProfile() async {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    String? imageUrl = _profilePicUrl;

    if (_profilePic != null) {
      imageUrl = await _uploadProfilePic(_profilePic!);
    }

    await supabase.from('profiles').upsert({
      'id': user.id,
      'first_name': _firstNameController.text,
      'last_name': _lastNameController.text,
      'mobile_number': _phoneNumberController.text,
      'profile_photo': imageUrl,
    });

    setState(() {
      _profilePicUrl = imageUrl;
      _isEditing = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Profile updated successfully!"),
        backgroundColor: Colors.green,
      ),
    );
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
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Picture
            GestureDetector(
              onTap: _isEditing ? _pickProfilePic : null,
              child: CircleAvatar(
                radius: 80,
                backgroundImage:
                    _profilePic != null
                        ? FileImage(_profilePic!)
                        : (_profilePicUrl != null
                                ? NetworkImage(_profilePicUrl!)
                                : const AssetImage('assets/images/profile.png'))
                            as ImageProvider,
                child:
                    _isEditing
                        ? const Icon(Icons.camera_alt, color: Colors.white)
                        : null,
              ),
            ),
            const SizedBox(height: 20),

            // Editable Fields
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(labelText: 'First Name'),
              readOnly: !_isEditing,
            ),
            const SizedBox(height: 10),

            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: 'Last Name'),
              readOnly: !_isEditing,
            ),
            const SizedBox(height: 10),

            TextField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
              readOnly: !_isEditing,
            ),
            const SizedBox(height: 20),

            // Buttons
            if (_isEditing)
              ElevatedButton(
                onPressed: _saveProfile,
                child: const Text(" Update Profile"),
              )
            else
              ElevatedButton(
                onPressed: _toggleEdit,
                child: const Text("Edit Profile"),
              ),
          ],
        ),
      ),
    );
  }
}

extension on String {
  get error => null;
}
