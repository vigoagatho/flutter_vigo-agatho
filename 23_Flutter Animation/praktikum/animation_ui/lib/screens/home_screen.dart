import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isBig = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isBig = !isBig;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isBig ? 400 : 200,
                  height: isBig ? 400 : 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://i.pinimg.com/originals/1e/a7/78/1ea7783fd0e2d5eb9a3f0279b44d7971.jpg'),
                      fit: BoxFit.cover
                      )
                  ),
                ),
              ),
            ),
            // ElevatedButton(
            //   onPressed: (){
            //     setState(() {
            //       isBig = !isBig;
            //     });
            //   }, 
            //   child: const Text('Resize'))
          ],
        ),
      ),
    );
  }
}