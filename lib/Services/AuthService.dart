import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  final FirebaseAuth _fbAuth;

  AuthService(this._fbAuth);

  Stream<User> get authStateChanges => _fbAuth.authStateChanges();
  //sign in anonymous
  Future<String> signInEmailPassword({String email, String password}) async {
    try {
      await _fbAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Signed in';
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  //register with email and password
  Future<String> signUpEmailPassword({String email, String password}) async {
    try {
      await _fbAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Account Created';
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  //sign out
  Future<void> signOut() async {
    await _fbAuth.signOut();
  }
}
