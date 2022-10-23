import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:telegram_clone/home.dart';

void main() {
  testWidgets('Judul Harus Telegram', (WidgetTester tester)async{
    await tester.pumpWidget(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

    expect(find.text('Telegram'), findsOneWidget);
  });
  testWidgets('Kontak harus ada nama Jinsoul', (WidgetTester tester)async{
    await tester.pumpWidget(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

    expect(find.text('Jinsoul'), findsOneWidget);
  });
}