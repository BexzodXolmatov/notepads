import 'package:flutter/material.dart';
import 'package:notepads/screens/crud_db_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: CrudbScreen(),
    );
  }
}
