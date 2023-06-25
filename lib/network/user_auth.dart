import 'package:firebase_auth/firebase_auth.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 23.06.2023.
class UserAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithPhoneNumber(String phoneNumber,
      {int? forceResendingToken,
      required Function(PhoneAuthCredential) verificationCompleted,
      required Function(String, int?) onCodeSent}) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          // ignore: todo
          //TODO: Log to crashlytics
        }
      },
      codeSent: onCodeSent,
      timeout: const Duration(seconds: 120),
      forceResendingToken: forceResendingToken,
      codeAutoRetrievalTimeout: (String verificationId) {
        // ignore: todo
        ///TODO('In the next phase add the counter time feature')
      },
    );
  }

  Future<void> signUpUser(PhoneAuthCredential credential) async {
    await _auth.signInWithCredential(credential);
  }

  Future<void> onCodeSent(String verificationId, String smsCode) async {
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    // Sign the user in (or link) with the credential
    await _auth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    return _auth.signOut();
  }

  bool isUserSignedIn() {
    return _auth.currentUser != null;
  }

  String? getUserId() {
    return _auth.currentUser?.uid;
  }

  String? getUserName() {
    return _auth.currentUser?.displayName;
  }

  String? getPhoneNumber() {
    return _auth.currentUser?.phoneNumber;
  }

  String? getUserPhotoUrl() {
    return _auth.currentUser?.photoURL;
  }

  bool? userExists(String phoneNumber) {
    return true;
  }
}
