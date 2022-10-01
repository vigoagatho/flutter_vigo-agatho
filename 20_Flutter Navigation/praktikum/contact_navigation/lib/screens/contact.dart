import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({ Key? key }) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  List contacts = [
    {'name': 'Rei Gemay', 'num':'089532462088'},
    {'name': 'Haewon', 'num':'081267863245'},
    {'name': 'Olip', 'num':'087809672170'},
    {'name': 'Sullyoon Cangtipp', 'num':'0893001582491'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: ((context, index){
          return Container(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.purple.shade700,
              ),
              title: Text(contacts[index]['name']),
              subtitle: Text(contacts[index]['num']),
            ),
          );
        })),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushNamed('/add_contact');
        },
        child: Icon(Icons.person_add),
        ),
    );
  }


  
}