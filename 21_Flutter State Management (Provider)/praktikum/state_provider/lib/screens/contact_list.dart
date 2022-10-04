import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/providers/contact_provider.dart';
import 'package:state_provider/screens/contact_form.dart';

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ContactProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kontak'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        itemCount: provider.contacts.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: const Icon(Icons.person, size: 50,),
            tileColor: Colors.grey.shade800,
            title: Text(provider.contacts[index].name),
            subtitle: Text(provider.contacts[index].number),
          );
        }),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade800,
        child:  Icon(Icons.contacts_outlined, color: Colors.grey.shade300,),
        onPressed: () async {
          await Navigator.push(
            context, MaterialPageRoute(
              builder: (context){
                return AddContact();
              }));
        }),
    );
  }
}