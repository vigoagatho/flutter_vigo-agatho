import 'package:flutter/material.dart';
import 'package:grid_view/grid.dart';

class ListPage extends StatelessWidget {
  const ListPage({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List kontak'),),
      body: ListView(
        children: [
          contact(url: 'assets/rei.jfif', name: 'Rei', num: '+62 812 4567 0982'),
          contact(url: 'assets/olip.jpeg', name: 'Olip Awuu', num: '+62 878 2577 1493'),
          contact(url: 'assets/jinsoul.jpg', name: 'Jinsoul', num: '+62 893 3325 91541'),
          contact(url: 'assets/ryujin.jpg', name: 'Ryujin', num: '+62 823 7851 6632'),
          contact(url: 'assets/yeojin.jpg', name: 'Yeojin Bocil', num: '+62 812 5571 6160'),
          contact(url: 'assets/three.jpg', name: 'Yujin <3', num: '+62 852 8893 5048'),
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
            onPressed: (() {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return GridPage();
              }));
            }),
            child: Icon(Icons.arrow_forward),
          ),
    );
  }

  Container contact({String url, String name, String num}) {
    return Container(
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: ExactAssetImage(url),
            ),
            title: Text(name, style: TextStyle(fontWeight: FontWeight.w500),),
            subtitle: Text(num),
          ),
        );
  }
}