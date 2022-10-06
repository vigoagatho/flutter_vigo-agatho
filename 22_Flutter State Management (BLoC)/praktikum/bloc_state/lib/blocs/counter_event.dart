import 'package:bloc_state/models/contacts.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CounterEvent {
const CounterEvent();

List<Object> get props => [];
}

class InitializeCounterEvent extends CounterEvent{}

class AddContact extends CounterEvent {
  Contacts contactModel;

  AddContact({required this.contactModel});
}

