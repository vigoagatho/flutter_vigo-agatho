import 'package:flutter/material.dart';

@immutable
abstract class CounterState{
  const CounterState();

  List<Object> get props => [];
}

class ContactsInitial extends CounterState {}

class ContactLoaded extends CounterState {
  var items = [];
  ContactLoaded({required this.items});
}
