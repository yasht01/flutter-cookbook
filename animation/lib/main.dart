import 'package:flutter/material.dart';
import 'package:animation/home_page.dart';
import 'package:animation/contact_me_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/contact_me': (context) => ContactPage(),
      },
    );
  }
}
