import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/screens/contact_list.dart';
import 'package:state_provider/providers/contact_provider.dart'
    as contact_store;

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => contact_store.ContactProvider()),
  ],
  child: const MyApp(),
  ),
  
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Sen'),
      home: ContactListScreen(),
    );
  }
}
