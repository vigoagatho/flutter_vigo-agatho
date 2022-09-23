import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailPage extends StatelessWidget {

  final String imPath;
  final String name;
  final String bDate;
  final String gBand;
  DetailPage({
    this.imPath,
    this.name,
    this.bDate,
    this.gBand
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Idol Detail', style: TextStyle(fontWeight: FontWeight.bold),)
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imPath),
                fit: BoxFit.cover
                )
            ),
          ),
          SlidingUpPanel(
            parallaxEnabled: true,
            backdropColor: Colors.grey.shade400,
            backdropEnabled: true,
            maxHeight: size.height*0.8,
            minHeight: size.height*0.1,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            panelBuilder: (controller){
              return SingleChildScrollView(
                controller: controller,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 15),
                        height: 10,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade400
                        ),
                      ),
                    ),
                    Container(padding: EdgeInsets.only(left: 20, top: 10, bottom: 20), child: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(imPath),
                      ),
                    ),
                    Container(padding: EdgeInsets.only(left: 20, top: 20), child: Text('Birth Date :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
                    Container(padding: EdgeInsets.only(left: 20, top: 7), child: Text(bDate, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
                    Container(padding: EdgeInsets.only(left: 20, top: 20), child: Text('Group Name :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
                    Container(padding: EdgeInsets.only(left: 20, top: 7), child: Text(gBand, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
                  ],
                ),
              );
            },
          )
        ],
      )
    );
  }
}