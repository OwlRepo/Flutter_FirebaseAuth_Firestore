import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:webrtc_app/Routes/Authenticate/Authenticate.dart';
import 'package:webrtc_app/Routes/Home/Home.dart';
import 'package:webrtc_app/Services/AuthService.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final authService = AuthService(FirebaseAuth.instance);
  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 5), () {
    //   authService.signInEmailPassword(
    //       email: 'tytotest@gmail.com', password: 'abc123');
    // })
    // .then((value) {
    //   Future.delayed(
    //     Duration(seconds: 5),
    //     () {
    //       authService.signOut();
    //     },
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder(
          stream: authService.authStateChanges,
          builder: (context, snapshot) {
            return snapshot.data == null ? Authenticate() : Home();
          },
        ),
      ),
    );
  }
}
