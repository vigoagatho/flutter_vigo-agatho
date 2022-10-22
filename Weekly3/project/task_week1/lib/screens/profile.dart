import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_week1/models/login_model.dart';
import 'package:task_week1/providers/login_provider.dart';
import 'package:task_week1/screens/msg_history.dart';
import 'package:task_week1/screens/service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  SharedPreferences loginData;
  String name = '';
  String email = '';
  String date = '';
  String desc = '';

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      name = loginData.getString('name').toString();
      email = loginData.getString('email').toString();
      date = loginData.getString('date').toString();
      desc = loginData.getString('desc').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            return Navigator.push(
                context, MaterialPageRoute(builder: (context) => ContactUs()));
          },
          child: Icon(Icons.arrow_back),
        ),
        title: const Text(
          'My Profile',
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
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return MsgHistory();
            }));
          }, icon: Icon(Icons.outbox_outlined))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Text('Name :'),
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 8,
              ),
              Text('Email :'),
              Text(
                email,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 8,
              ),
              Text('Birthdate :'),
              Text(
                date,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
              ),
              const SizedBox(
                height: 8,
              ),
              Text('About me :'),
              Text(
                desc,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 13,
              ),

              // Old UI
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: 1,
              //     itemBuilder: ((context, index) {
              //       if(index != 0){
              //         return ListTile(
              //         title: Text(provider.loginModel[index].name),
              //         subtitle: Text(provider.loginModel[index].email),
              //         tileColor: Colors.purple.shade800,
              //       );
              //       }
              //       else return null;
              //     })),
              // ),
              // Padding(
              //   padding: EdgeInsets.all(10.0),
              //   child: Container(
              //     child: Text(date),
              //   ),
              //   ),
              // Padding(
              //   padding: EdgeInsets.all(10.0),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(15)
              //     ),
              //     child: Text(desc),
              //   ),
              //   ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: Colors.purple.shade600),
                  onPressed: () {
                    loginData.setBool('login', true);
                    loginData.remove('name');
                    loginData.remove('email');
                    loginData.remove('date');
                    loginData.remove('desc');
                    provider.removeData(LoginModel(name: name, email: email));
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ContactUs()));
                  },
                  child: Text('LogOut'))
            ],
          ),
        ),
      ),
    );
  }
}
