import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:webrtc_app/Routes/Wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WEBRTC_APP',
      home: Wrapper(),
    );
  }
}
