import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/models/contacts.dart';
import 'package:state_provider/providers/contact_provider.dart'
    as contact_store;
class AddContact extends StatefulWidget {
  const AddContact({ Key? key }) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  String name = '';
  String number = '';
  var nameController = TextEditingController();
  var numberController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<contact_store.ContactProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kontak'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: TextFormField(
                controller: nameController,
                onChanged: (String value){
                  name = value;
                },
                validator: (String? value){
                  return value == '' ? 'Nama Belum di isi' : null;
                },
                decoration:  InputDecoration(
                  prefixIcon: const Icon(Icons.person_add),
                  hintText: 'Nama',
                  labelText: 'Nama',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 30),
              child: TextFormField(
                controller: numberController,
                onChanged: (String value){
                  number = value;
                },
                validator: (String? value){
                  return value == '' ? 'Nomor Belum di isi' : null;
                },
                decoration:  InputDecoration(
                  prefixIcon: const Icon(Icons.numbers_rounded),
                  hintText: 'Nomor Telepon',
                  labelText: 'Nomor Telepon',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))
                ),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                if (!_formKey.currentState!.validate()) return;
                _formKey.currentState!.save();
                provider.addContact(Contacts( name: name, number: number));
                Navigator.pop(context);
              },
              child: const Text('Tambahkan'))
          ],
        )),
    );
  }
}