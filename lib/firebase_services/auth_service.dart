import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> loginmethod(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Login failed");
    }
    return null;
  }

  Future<User?> Usigninmethod(
      String name, String email, String phoneno, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Additional logic to store user details (if needed)

      return credential.user;
    } catch (e) {
      print("Registration failed: $e");
    }
    return null;
  }

  Future<String?> resetpwd(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return "email sent";
    } catch (e) {
      print("not sent");
    }
    return null;
  }
}
