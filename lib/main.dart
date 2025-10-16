import 'package:flutter/material.dart';
import 'package:uts_2022130009/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BShop',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const LoginScreen(),
    );
  }
}
