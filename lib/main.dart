import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/screens/chatscreen.dart';
import 'package:chatapp/screens/registerscreen.dart';
import 'package:chatapp/screens/signinscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const scholarchatapp());
}

class scholarchatapp extends StatelessWidget {
  const scholarchatapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Registerscreen.id: (BuildContext context) => Registerscreen(),
        Signinscreen.id: (BuildContext context) => Signinscreen(),
        Chatscreen.id: (context) => Chatscreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: Signinscreen.id,
    );
  }
}
