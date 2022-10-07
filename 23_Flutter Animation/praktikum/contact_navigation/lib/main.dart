import 'package:contact_navigation/screens/add_contact.dart';
import 'package:contact_navigation/screens/contact.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Contact(),
      initialRoute: '/',
      routes: {
        '/contact': (_)=> Contact(),
        '/add_contact': (_)=> AddContact()
      }
        
    );
  }
}