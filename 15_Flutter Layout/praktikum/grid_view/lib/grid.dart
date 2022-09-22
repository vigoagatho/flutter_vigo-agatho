import 'package:flutter/material.dart';
import 'package:grid_view/list.dart';

class GridPage extends StatelessWidget {
  const GridPage({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grid Collections'),
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return ListPage();
            }));
          },
          icon: Icon(Icons.arrow_back, color: Colors.white,))
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: [
          icon(mark: Icons.abc_rounded),
          icon(mark: Icons.password),
          icon(mark: Icons.person_add),
          icon(mark: Icons.menu_book),
          icon(mark: Icons.arrow_right_rounded),
          icon(mark: Icons.analytics),
          icon(mark: Icons.horizontal_distribute),
          icon(mark: Icons.chat),
          icon(mark: Icons.soap_rounded),
          icon(mark: Icons.speaker),
          icon(mark: Icons.browser_updated_outlined),
          icon(mark: Icons.campaign_rounded),
          icon(mark: Icons.settings),
          icon(mark: Icons.question_mark_outlined),
          icon(mark: Icons.question_answer_rounded),
          icon(mark: Icons.lock),
          icon(mark: Icons.lock_clock),
          icon(mark: Icons.time_to_leave),
          icon(mark: Icons.people_alt),
          icon(mark: Icons.android_rounded),
          icon(mark: Icons.group_off_outlined),
          icon(mark: Icons.travel_explore),
          icon(mark: Icons.phone_android),
          icon(mark: Icons.system_security_update),
        ],
        ),

    );
  }

  Container icon({IconData mark}) {
    return Container(
          margin: EdgeInsets.all(25),
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blueAccent),
          child: Icon(mark, color: Colors.white,),
        );
  }
}