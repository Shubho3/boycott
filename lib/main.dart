import 'dart:convert';
import 'package:flutter/material.dart';

import 'Screens/loginSignupScreens/SplashScreen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );}

}
