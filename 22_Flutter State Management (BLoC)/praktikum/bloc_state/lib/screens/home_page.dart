import 'package:bloc_state/blocs/counter_bloc.dart';
import 'package:bloc_state/blocs/counter_event.dart';
import 'package:bloc_state/blocs/counter_state.dart';
import 'package:bloc_state/models/contacts.dart';
import 'package:bloc_state/screens/contact_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    context.read<CounterBloc>().add(InitializeCounterEvent());
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Daftar Kontakqu'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is ContactsInitial){
                  return const CircularProgressIndicator();
                }
                if (state is ContactLoaded) {
                  return ListView.separated(
                    itemBuilder: (context, index){
                      Contacts item = state.items[index];
                      return ListTile(
                        leading: const Icon(Icons.person, size: 50,),
                        title: Text(item.name),
                        subtitle: Text(item.number),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index){
                      return const Divider(height: 0.3,);
                    },
                    itemCount: state.items.length);
                }
                return Container();
              }
              ),
            ),
            floatingActionButton: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return FloatingActionButton(
                child: const Icon(Icons.person_add),
                onPressed: () async {
                  Contacts data = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddScreen()));
                  setState(() {
                    state.props.add(Contacts(
                        name: data.name,
                        number: data.number));
                  });
                },
              );
            },
          ),
        );
      },
    );
  }
}