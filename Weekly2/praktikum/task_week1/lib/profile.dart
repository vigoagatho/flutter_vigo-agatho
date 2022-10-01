import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  final String name;
  final String email;
  final String date;
  final String desc;

  const ProfilePage({ Key key, @required this.name, this.email, this.date, this.desc,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.purple.shade600, Colors.grey.shade800],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight)),
        ),
      ),
      
    );
  }
}
