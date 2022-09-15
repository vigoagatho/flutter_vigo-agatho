import 'dart:async';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //timeleft
  int timeLeft = 10;


  //countdown method
  void _startCountdown(){
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft>0) {
          setState(() {
          timeLeft--;
        });
      }
      else{
        timer.cancel();
      }
     });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(timeLeft.toString(), style: TextStyle(fontSize: 70),
            ),
            MaterialButton(onPressed: _startCountdown,
            child: Text(
              'Start', style: TextStyle(color: Colors.white),
            ),
            color: Colors.deepOrange,)
          ],
        ),
      ),
      
    );
  }
}
