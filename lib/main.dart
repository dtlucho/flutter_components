import 'package:flutter/material.dart';

// import 'package:flutter_components/src/pages/home_temp.dart';
import 'package:flutter_components/src/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Components App',
      // home: HomePageTemp(),
      home: HomePage(),
    );
  }
}
