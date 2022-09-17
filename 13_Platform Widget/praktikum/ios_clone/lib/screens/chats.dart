import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({ Key key }) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final List<String> categories = ['All Chats','Work','Unread','Personal'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Chats'),
        trailing: Icon(CupertinoIcons.square_arrow_down, color: CupertinoColors.activeBlue,),
      ),

      body: 
      Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: CupertinoSearchTextField(),
          ),
          Center(
            child: Container(
              
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 23,
                      vertical: 5
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 1
                      ),
                      ),
                    );
                }
                ),
            ),
            
          ),
          Divider(height: 1,),
          list(url: 'assets/three.jpg', name: 'Yujin', time: '5m ago', msg: 'Aku tunggu di depan yahh', dsc: '2', isRead: true),
          Divider(height: 0.2,),
          list(url: 'assets/rei.jfif', name: 'Rei Wibu', time: '20m ago', msg: 'Lu aja ya yang jemput yujin', dsc: '0', isRead: false),
          Divider(height: 0.2,),
          list(url: 'assets/jinsoul.jpg', name: 'Jinsoul', time: '25m ago', msg: 'Besok antarin cari gorengan yah buat nyemil', dsc: '0', isRead: false),
          Divider(height: 0.2,),
          list(url: 'assets/ryujin.jpg', name: 'Ryujin Bandung', time: '1h ago', msg: 'Fajar asik yah anaknya ._.', dsc: '1', isRead: true),
          Divider(height: 0.2,),
          list(url: 'assets/haruka.jpg', name: 'Haruka Bacot', time: '5h ago', msg: 'BANGUN EGO! NGGA KULIAH LU?! -_-"', dsc: '0', isRead: false),
          Divider(height: 0.2,),
          list(url: 'assets/sus.png', name: 'Amogus', time: '1d ago', msg: 'Yakin lu mau begitu terus?', dsc: '1', isRead: true),
          // Divider(height: 0.2,),
        ],
      )
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
              border: isRead ? Border.all(width: 5, color: Colors.blue[400]) : Border.all(width: 5, color: Colors.white),
              borderRadius: BorderRadius.circular(200) ,
              color: isRead ? Colors.blue.shade400 : Colors.white
            ),
            )
        ]),)

    );
  }
}