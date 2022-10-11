import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_week1/models/login_model.dart';
import 'package:task_week1/providers/login_provider.dart';
import 'package:task_week1/screens/service.dart';


class ProfilePage extends StatefulWidget {


  const ProfilePage({ Key key}) : super(key: key);

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

  void initial() async{
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
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text(provider.loginModel[index].name),
                  subtitle: Text(provider.loginModel[index].email),
                  tileColor: Colors.purple.shade800,
                );
              })),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              child: Text(date),
            ),
            ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
              ),
              child: Text(desc),
            ),
            ),
            ElevatedButton(onPressed: (){
              loginData.setBool('login', true);
              loginData.remove('name');
              loginData.remove('email');
              loginData.remove('date');
              loginData.remove('desc');
              provider.removeData(LoginModel(name: name, email: email));
              Navigator.pushReplacement(
                context, MaterialPageRoute(
                  builder: (context)=> ContactUs()));
            },
            child: Text('LogOut'))
        ],
      ),
      
    );
  }
}
