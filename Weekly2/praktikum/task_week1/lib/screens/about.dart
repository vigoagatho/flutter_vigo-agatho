import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Orbital Station-01',
          style: TextStyle(),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.purple.shade600, Colors.grey.shade800],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight)),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            Center(
              child: Container(
                child: const Text(
                  'About Us',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: const Text(
                    'This app was made to gather orbit all around the globe. As a fans of LOONA, we really wanted to make a platform where Orbit can express themselves and meet each others. This app provides some features that can help new Orbit and entertain Orbit as a fanbase of Loona.',
                    style: TextStyle(
                      fontSize: 15
                    ),
                    textAlign: TextAlign.justify,
                    ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30, left: 15),
              child: Text('Features that we provided :', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            buildCard(
                icon: Icons.info_outline, text: 'LOONA Related Information'),
            buildCard(icon: Icons.games_outlined, text: 'Quiz Game'),
            buildCard(icon: Icons.people_alt_outlined, text: 'Orbit Comunity'),
          ],
        ),
      ),
    );
  }

  Card buildCard({IconData icon, String text}) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            child: Icon(icon),
          ),
          Text(text)
        ],
      ),
    );
  }
}
