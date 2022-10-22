import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/service.dart';
import 'package:task_week1/providers/login_provider.dart' as login_provider;
import 'package:task_week1/providers/question_provider.dart' as quest_provider;

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(
      create: (_)=> login_provider.LoginProvider()), ChangeNotifierProvider(create: (_)=> quest_provider.AskProvider())],
    child: MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Sen',
        brightness: Brightness.dark
      ),
      home: ContactUs(),
    );
  }
}