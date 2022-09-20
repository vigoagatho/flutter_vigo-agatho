import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:barcode_widget/barcode_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Badges'),
        ),
        body: Center(
          child: Column(
            children: [
              Chip(
                padding: EdgeInsets.all(0),
                backgroundColor: Colors.deepPurple,
                label: Text('BADGE', style: TextStyle(color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Badge(
                    toAnimate: false,
                    shape: BadgeShape.square,
                    badgeColor: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(8),
                    badgeContent: Text('BADGE', style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Divider(),
              BarcodeWidget(
                data: 'Alterra Academy', 
                barcode: Barcode.code128(),
                width: 200,
                height: 100,
                ),
              Divider(),
              BarcodeWidget(
                data: 'Flutter Asik', 
                barcode: Barcode.code128(),
                width: 200,
                height: 100,
                ),
              Divider(),
              BarcodeWidget(
                data: 'Vigo Agatho', 
                barcode: Barcode.code128(),
                width: 200,
                height: 100,
                ),
            ],
          )
        ),
    )
    );
  }
}
