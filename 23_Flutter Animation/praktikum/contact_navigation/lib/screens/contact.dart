import 'package:contact_navigation/screens/add_contact.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  List contacts = [
    {'name': 'Rei Gemay', 'num': '089532462088', 'img': 'assets/rei.jpg'},
    {'name': 'Haewon', 'num': '081267863245', 'img': 'assets/haewon.jpg'},
    {'name': 'Olip', 'num': '087809672170', 'img': 'assets/olhye.jpg'},
    {
      'name': 'Sullyoon Cangtipp',
      'num': '0893001582491',
      'img': 'assets/sy.jpg'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: ((context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: ExactAssetImage(contacts[index]['img']),
                ),
                title: Text(contacts[index]['name']),
                subtitle: Text(contacts[index]['num']),
              ),
            );
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
            return const AddContact();
          }, transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
            final tween = Tween(begin: const Offset(0, 2), end: Offset.zero);
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          }));
        },
        child: Icon(Icons.person_add),
      ),
    );
  }
}
