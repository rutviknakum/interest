import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Login Method
  Future<User?> login(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      print("Login failed: $e");
      return null;
    }
  }

  // Register Method
  Future<User?> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNo,
    required String password,
    required bool isAdmin,
    File? profilePic,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String? profilePicUrl;

      if (profilePic != null) {
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        UploadTask uploadTask =
            _storage.ref().child('profile_pics/$fileName').putFile(profilePic);
        TaskSnapshot snapshot = await uploadTask;
        profilePicUrl = await snapshot.ref.getDownloadURL();
      }

      await _firestore.collection('users').doc(credential.user?.uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNo': phoneNo,
        'uid': credential.user?.uid,
        'isAdmin': isAdmin,
        if (profilePicUrl != null) 'profilePicUrl': profilePicUrl,
      });

      return credential.user;
    } catch (e) {
      print("Registration failed: $e");
      return null;
    }
  }

  // Check if the current logged-in user is an admin
  Future<bool> isAdmin() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user.uid).get();
        return userDoc['isAdmin'] ?? false;
      }
    } catch (e) {
      print("Error checking admin status: $e");
    }
    return false;
  }

  // Fetch User Details
  Future<Map<String, dynamic>?> fetchUserDetails() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user.uid).get();
        if (userDoc.exists) {
          return userDoc.data() as Map<String, dynamic>?;
        }
      }
    } catch (e) {
      print("Error fetching user details: $e");
    }
    return null;
  }

  // Update User Profile
  Future<String> updateProfile({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    File? profilePic,
  }) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        String? profilePicUrl;

        if (profilePic != null) {
          String fileName = DateTime.now().millisecondsSinceEpoch.toString();
          UploadTask uploadTask = _storage
              .ref()
              .child('profile_pics/$fileName')
              .putFile(profilePic);
          TaskSnapshot snapshot = await uploadTask;
          profilePicUrl = await snapshot.ref.getDownloadURL();
        }

        await _firestore.collection('users').doc(user.uid).update({
          'firstName': firstName,
          'lastName': lastName,
          'phoneNumber': phoneNumber,
          if (profilePicUrl != null) 'profilePicUrl': profilePicUrl,
        });

        return "Profile updated successfully!";
      }
      return "No user found!";
    } catch (e) {
      print("Error updating profile: $e");
      return "Failed to update profile!";
    }
  }

  // Reset Password by Email
  Future<String> resetPasswordByEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return "Password reset email sent!";
    } catch (e) {
      print("Error resetting password: $e");
      return "Failed to send password reset email.";
    }
  }

  // Set Admin Status
  Future<void> setAdmin(String uid, bool isAdmin) async {
    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .update({'isAdmin': isAdmin});
    } catch (e) {
      print("Error updating admin status: $e");
    }
  }

  // Fetch Admin Details
  Future<Map<String, dynamic>?> fetchAdminDetails() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user.uid).get();
        if (userDoc.exists && (userDoc['isAdmin'] ?? false)) {
          return {
            'firstName': userDoc['firstName'],
            'lastName': userDoc['lastName'],
            'phoneNumber': userDoc['phoneNumber'],
            'profilePicUrl': userDoc['profilePicUrl'],
          };
        }
      }
    } catch (e) {
      print("Error fetching admin details: $e");
    }
    return null;
  }

  // Pick Profile Picture
  Future<File?> pickProfilePic() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  // Sign Out Method
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Sign out failed: $e");
    }
  }
}
