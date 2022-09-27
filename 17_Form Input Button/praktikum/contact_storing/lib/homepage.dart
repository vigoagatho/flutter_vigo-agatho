// ignore_for_file: prefer_const_constructors
import 'package:contact_storing/add_contact.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List contacts = [
    {'Name': 'Sicantik', 'Number': '0895324620750'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView.builder(
          itemCount: contacts.length,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          itemBuilder: ((context, index) {
            return ListTile(
              tileColor: Colors.green.shade400,
              title: Text(contacts[index]['Name']),
              subtitle: Text(contacts[index]['Number']),
            );
          })),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final Map<String, dynamic> result = await Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return ContactAdd();
            }));

            contacts.add(result);

            setState(() {});
          },
          child: Icon(Icons.contacts)),
    );
  }
}
