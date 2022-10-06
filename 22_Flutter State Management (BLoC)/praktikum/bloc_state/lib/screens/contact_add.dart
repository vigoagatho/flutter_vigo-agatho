import 'package:bloc_state/blocs/counter_bloc.dart';
import 'package:bloc_state/blocs/counter_event.dart';
import 'package:bloc_state/models/contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String _name = '';
  final _numberController = TextEditingController();
  String _number = '';

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
    _numberController.addListener(() {
      setState(() {
        _number = _numberController.text;
      });
    });
  }

  @override
  void dispose(){
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nambahin Kontaq'),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                child: TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Isi nama kontaknya dulu kk';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'Nama',
                      labelText: 'Nama',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                child: TextFormField(
                  controller: _numberController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Isi nomer kontaknya dulu kk';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.numbers),
                      hintText: 'Nomer',
                      labelText: 'Nomer',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  final contact = Contacts(
                    name: _name, number: _number);
                  if (_formKey.currentState!.validate()){
                    context
                      .read<CounterBloc>()
                      .add(AddContact(contactModel: contact));
                  }
                  Navigator.pop(context);
                },
                child: const Text('Simpan Kontaq'))
            ],
          )),
    );
  }
}
