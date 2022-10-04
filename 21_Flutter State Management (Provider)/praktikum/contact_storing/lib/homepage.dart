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
    {'Name': 'Ganteng', 'Number': '0895324620750'}
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
              leading: Icon(Icons.person_pin_circle_outlined, size: 50,color: Colors.white,),
              tileColor: Colors.grey.shade800,
              title: Text(contacts[index]['Name'], style: TextStyle(color: Colors.white),),
              subtitle: Text(contacts[index]['Number'], style: TextStyle(color: Colors.white)),
            );
            
          })),
          
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue.shade300,
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
