import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nish_hair/provider/auth.dart';
import 'package:provider/provider.dart';
import 'pages/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<Auth>(
    create: (context) => Auth(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
