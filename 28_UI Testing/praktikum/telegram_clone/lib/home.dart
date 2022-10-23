import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff55879f),
        title: Text('Telegram', 
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.search, size: 25,),
          )
        ],
      ),

      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 250,
              color: Colors.blue,
              child: Container(
                width: double.infinity,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: ExactAssetImage('assets/sus.png'),
                      ),
                      SizedBox(height : 10),
                      Text('Pigoy Arigato', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('+62 895 12345678', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600 ),),
                          Icon(Icons.keyboard_arrow_down_outlined, size: 25, color: Colors.white70,)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            menuTiles(menu: 'New Group', iconMenu: Icons.people),
            menuTiles(menu: 'New Secret Chat', iconMenu: Icons.lock),
            menuTiles(menu: 'New Channel', iconMenu: Icons.campaign_rounded),
            Divider(height: 10,),
            menuTiles(menu: 'Contacts', iconMenu: Icons.person_pin_rounded),
            menuTiles(menu: 'Invite Friends', iconMenu: Icons.person_add),
            menuTiles(menu: 'Settings', iconMenu: Icons.settings_rounded),
            menuTiles(menu: 'Telegram FAQ', iconMenu: Icons.question_mark_rounded)
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat),
        backgroundColor: Color(0xff55879f),
      ),

      body: Column(
        children: [
          list(url: 'assets/jinsoul.jpg', name: 'Jinsoul', time: '08.00 pm', msg: 'Warkop kah goy?', dsc: '1', isRead: true),
          Divider(height: 0.2,),
          // list(url: 'assets/ryujin.jpg', name: 'Ryujin Bandung', time: '07.49 pm', msg: 'Fajar dimana cok?', dsc: '1', isRead: true),
          // Divider(height: 0.2,),
           list(url: 'assets/three.jpg', name: 'Yujin', time: '07.30 pm', msg: 'Goy kamu dimana?', dsc: '1', isRead: true),
          Divider(height: 0.2,),
           list(url: 'assets/two.jpg', name: 'Jieun', time: '07.10 pm', msg: 'Mager banget anjir', dsc: '0', isRead: false),
          Divider(height: 0.2,),
           list(url: 'assets/nijar.png', name: 'Nijar Gokil', time: '06.00 pm', msg: 'Valorant apa ke Warkop?', dsc: '1', isRead: true),
          Divider(height: 0.2,),
           list(url: 'assets/yoru.jpg', name: 'Kang Joki', time: '04.15 pm', msg: 'Done yah bos jokinya', dsc: '1', isRead: false),
          Divider(height: 0.2,),
           list(url: 'assets/rei.jfif', name: 'Rei Jepun', time: '03.20 pm', msg: 'Read napa?', dsc: '5', isRead: true),
          Divider(height: 0.2,),
        ],
      )
    );
  }

  ListTile menuTiles({String menu, IconData iconMenu}) {
    return ListTile(
            leading: Icon(iconMenu, color: Colors.black54, size: 30,),
            title: Text(menu, style: TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.w600),),
          );
  }

  ListTile list({String url, String name, String time, String msg, String dsc, bool isRead}) {
    return ListTile(
      contentPadding: EdgeInsets.only(top: 5, left: 10),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: ExactAssetImage(url),
      ),
      title: Padding(
        padding: EdgeInsets.only(right: 10),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19
          ),),
          Text(time, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),)
        ],
      ),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(msg, style: TextStyle(fontWeight: FontWeight.w500),),
            Container(
              child: Text(dsc, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: isRead ? Border.all(width: 5, color: Colors.green) : Border.all(width: 0, color: Colors.white),
                color: isRead ? Colors.green : Colors.white
              ),
              )
          ]),)
    );
  }
}