import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webrtc_app/Services/AuthService.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> documents = [];
  @override
  Widget build(BuildContext context) {
    final authService = AuthService(FirebaseAuth.instance);
    final CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('QUIZLIST');
    @override
    void dispose() {
      super.dispose();
      authService.dispose();
    }

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55.0),
              child: ElevatedButton(
                onPressed: () async {
                  print(await authService.signUpEmailPassword(
                    email: 'tytotest1@gmail.com',
                    password: 'abc123',
                  ));
                },
                child: Text('Create Account'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55.0),
              child: ElevatedButton(
                onPressed: () {
                  collectionReference.snapshots().listen((snapshots) {
                    setState(() {
                      documents.add(snapshots.docs[0].data());
                    });
                  });
                },
                child: Text('Fetch and print data'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55.0),
              child: ElevatedButton(
                onPressed: () {
                  authService.signOut();
                },
                child: Text('Sign Out'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55.0),
              child: Text(documents.isEmpty
                  ? 'NO DATA'
                  : documents[0]['answers']['answer1'].toString()),
            ),
          ],
        ),
      ),
    );
  }
}
