import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_state/blocs/counter_event.dart';
import 'package:bloc_state/blocs/counter_state.dart';
import 'package:bloc_state/models/contacts.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() : super(ContactsInitial()){
    on<InitializeCounterEvent>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(ContactLoaded(items: [
        Contacts(name: 'name', number: 'number')
      ]));
    });

    on<AddContact>((event, emit) {
      final state = this.state as ContactLoaded;
      final list = state.items;
      list.add(event.contactModel);
      emit(ContactLoaded(items: list));
    });
  }
}