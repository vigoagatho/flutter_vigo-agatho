import 'package:flutter/material.dart';
import 'package:state_provider/models/contacts.dart';

class ContactProvider with ChangeNotifier{
  final List<Contacts> _contacts = [];
  List<Contacts> get contacts => _contacts;

  void addContact(Contacts contact) {
    _contacts.add(contact);
    notifyListeners();
  }

}