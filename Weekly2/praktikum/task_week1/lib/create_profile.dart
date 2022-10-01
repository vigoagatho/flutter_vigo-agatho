// ignore_for_file: prefer_const_constructors
import 'dart:io';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:intl/intl.dart';
import 'package:task_week1/profile.dart';

class ProfileAdd extends StatefulWidget {
  const ProfileAdd({Key key}) : super(key: key);

  @override
  State<ProfileAdd> createState() => _ProfileAddState();
}

class _ProfileAddState extends State<ProfileAdd> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController captionsController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  File img;
  String name;
  String email;
  String date;
  String desc;

  void _openFile(PlatformFile file){
    OpenFile.open(file.path);
  }

  void _pickFile() async{
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orbital Station-01',
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
      body: SingleChildScrollView(
        child: Center(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, left: 15, right: 15, bottom: 30),
                    child: Text(
                      'Let\'s Setup Your Profile First!',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  //Image Field
                  
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text('Pick Your Profile Picture')
                  ),
                  Padding(
                    padding: EdgeInsets.only( left: 10, right: 10),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.purple.shade700),
                        onPressed: () {
                          _pickFile();
                        },
                        child: Text(
                          'Open Image',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),

                  //Name Field
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: TextFormField(
                      controller: nameController,
                      validator: (String value){
                        return value == ''?'Let us know your name' : null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.abc_rounded),
                        hintText: 'Name',
                        label: Text('Name'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                    ),
                  ),

                  //Date Picker
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: TextFormField(
                      controller: dateController,
                      validator: (String value){
                        return value == ''?'Let us know your birth date' : null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_month_outlined),
                        hintText: 'Birth Date',
                        label: Text('Birth Date'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                      onTap: () async {
                        DateTime selectedDate =
                        await showDatePicker(
                          context: context, 
                          initialDate: DateTime.now(), 
                          firstDate: DateTime(2000), 
                          lastDate: DateTime(2025)
                          );
                        if (selectedDate != null){
                          setState(() {
                            dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
                          });
                        }
                      },
                    ),
                  ),

                  // Email Field
                   Padding(
                    padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: TextFormField(
                      controller: emailController,
                      validator: (String value){
                        return value == ''?'Let us know your email' : null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail_outline_outlined),
                        hintText: 'Email',
                        label: Text('Email'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                    ),
                  ),

                  //Captions field
                   Padding(
                    padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: TextFormField(
                      maxLines: 3,
                      controller: captionsController,
                      validator: (String value){
                        return value == ''?'Please Describe yourself' : null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.description_outlined),
                        hintText: 'Describe yourself',
                        label: Text('Captions'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                    ),
                  ),

                  //Save Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple.shade700
                    ),
                    onPressed: ((){
                      if (_formKey.currentState.validate()){
                        _formKey.currentState.save();
                        final String name = nameController.text;
                        final String email = emailController.text;
                        final String date = dateController.text;
                        final String desc = captionsController.text;
                        

                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProfilePage(name: name, email: email, date: date, desc: desc,)));
                      }
                    }),
                    child: Text('Save Profile'))
                ],
              )),
        ),
      ),
    );
  }
}
