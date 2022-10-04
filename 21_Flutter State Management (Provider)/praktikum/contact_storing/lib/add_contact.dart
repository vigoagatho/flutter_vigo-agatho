// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContactAdd extends StatefulWidget {
  const ContactAdd({Key? key}) : super(key: key);

  @override
  State<ContactAdd> createState() => _ContactAddState();
}

class _ContactAddState extends State<ContactAdd> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Kontak'),
      ),
      body: Form(
        key: _formKey,
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15, left: 20, right: 20),
            child: TextFormField(
              controller: nameController,
              validator: (String? value){
                return value == ''?'Nama belum di isi' : null;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_add),
                hintText: 'Name',
                label: Text('Name'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                ) 
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 20, right: 20),
            child: TextFormField(
              controller: numberController,
              validator: (String? value){
                return value == ''?'Nomor belum di isi' : null;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.numbers_sharp),
                hintText: 'Number',
                label: Text('Number'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                ) 
              ),
            ),
          ),
          ElevatedButton(
            onPressed: (() {
              if (_formKey.currentState!.validate()){
                _formKey.currentState!.save();

                final contact = {
                  'Name' : nameController.text,
                  'Number' : numberController.text
                };
                Navigator.pop(context, contact); 
              }
            }), 
            child: Text('Save Contact'))
        ],
      )
      ),
    );
  }
}
