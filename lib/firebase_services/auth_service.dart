import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> loginmethod(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {}
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

  Future<void> sendPhoneVerification(
      String phoneno,
      Function(String) onVerificationCompleted,
      Function(String, int?) onCodeSent,
      Function(String) onVerificationFailed) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneno,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        onVerificationCompleted("verification done");
      },
      verificationFailed: (FirebaseAuthException e) {
        onVerificationFailed(e.message ?? "phone no verification failed");
      },
      codeSent: (String verificationid, int? resendToken) {
        onCodeSent(verificationid, resendToken);
      },
      codeAutoRetrievalTimeout: (String verificationid) {
        print("Time out");
      },
    );
  }

  Future<String?> verifyPhoneOtp(String verificationid, String otp) async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationid, smsCode: otp);
      await _auth.signInWithCredential(credential);
      return "Phone Verification Successfull...!";
    } catch (e) {
      return "invalid otp ,try again...!";
    }
  }

  Future<String?> upadatePassword(String newpassword) async {
    try {
      await _auth.currentUser?.updatePassword(newpassword);
      return "password updated successfully...!";
    } catch (e) {
      return "falied to update password...!";
    }
  }
}
