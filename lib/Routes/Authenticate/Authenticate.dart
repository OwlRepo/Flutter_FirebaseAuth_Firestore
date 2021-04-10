import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webrtc_app/Services/AuthService.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  final authService = AuthService(FirebaseAuth.instance);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    authService.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              authService.signInEmailPassword(
                  email: 'tytotest@gmail.com', password: 'abc123');
            },
            child: Text('Sign In'),
          ),
        ),
      ),
    );
  }
}
