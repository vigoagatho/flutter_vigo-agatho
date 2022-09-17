import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_clone/screens/chats.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home : HomePage(), 
      theme: CupertinoThemeData(
        brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
    );
  }
}
class HomePage extends StatelessWidget {
  HomePage({ Key key }) : super(key: key);
  var screens = Chats();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        resizeToAvoidBottomInset: true,
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              label: 'Contacts',
              icon: Icon(CupertinoIcons.person_circle_fill)
            ),
            BottomNavigationBarItem(
              label: 'Calls',
              icon: Icon(CupertinoIcons.phone_fill)
            ),
            BottomNavigationBarItem(
              label: 'Chats',
              icon: Icon(CupertinoIcons.chat_bubble_2_fill)
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(CupertinoIcons.settings_solid)
            ),
          ]), 
        tabBuilder: (BuildContext context, int index){
          return screens;
        } ),
        );
  }
}
