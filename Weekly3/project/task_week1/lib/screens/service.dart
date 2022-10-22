// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_week1/models/question_model.dart';
import 'package:task_week1/screens/create_profile.dart';
import 'package:task_week1/screens/profile.dart';
import 'package:task_week1/screens/about.dart';
import 'package:task_week1/providers/question_provider.dart' as quest_provider;

class ContactUs extends StatefulWidget {
  const ContactUs({Key key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerMessage = TextEditingController();

  String firstName = '';
  String lastName = '';
  String email = '';
  String msg = '';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<quest_provider.AskProvider>(context);
    return Scaffold(
        appBar: AppBar(
          actions: [
            //Directing to Profile
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfilePage();
                  }));
                },
                icon: Icon(Icons.person))
          ],
          // leading: Icon(Icons.menu_rounded),
          title: Text(
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
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.purple.shade600,
                  Colors.grey.shade800
                ])),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Menu',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: Icon(
                  Icons.chat_outlined,
                  size: 40,
                ),
                title: Text(
                  'Contact Us',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {},
              ),
              ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: Icon(
                  Icons.contact_support_outlined,
                  size: 40,
                ),
                title: Text(
                  'About Us',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  return Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return AboutUs();
                  }));
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: Icon(
                  Icons.login_rounded,
                  size: 40,
                ),
                title: Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),

        //Main Body
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                'Welcome to LOONAVERSE',
                                style: TextStyle(fontSize: 20),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              height: 250,
                              width: 350,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://0.soompi.io/wp-content/uploads/2022/06/03081842/LOONA1.jpeg'))),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 5),
                            child: Container(
                              child: Text("New to the app?"),
                            ),
                          ),
                          Container(
                            //Directing to ProfileAdd
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.purple.shade300),
                                onPressed: (() {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ProfileAdd();
                                  }));
                                }),
                                child: Text('Start Your Journey!')),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 90),
                            child: Container(
                              child: Text(
                                'Have any question about this app?',
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Container(
                              child: Text(
                                  'Let us know if you have any questions or problems with our app by filling these form below, we will try our best to configure and fix them'),
                            ),
                          ),
                          //Row Input Field
                          Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Container(
                                child: Row(
                              children: [
                                //First Name input field
                                Container(
                                  padding: EdgeInsets.only(left: 15),
                                  width: 160,
                                  child: TextField(
                                    controller: controllerFirstName,
                                    decoration: InputDecoration(
                                        hintText: 'First Name',
                                        labelText: 'First Name',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ),
                                //Last Name input field
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  width: 170,
                                  child: TextField(
                                    controller: controllerLastName,
                                    decoration: InputDecoration(
                                        hintText: 'Last Name',
                                        labelText: 'Last Name',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ),
                              ],
                            )),
                          ),
                          //End of Row input field

                          //Email input field
                          Container(
                            padding:
                                EdgeInsets.only(top: 20, left: 15, right: 14),
                            child: TextField(
                              controller: controllerEmail,
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  labelText: 'Email',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),

                          //Message input field
                          Container(
                            padding:
                                EdgeInsets.only(top: 20, left: 15, right: 14),
                            child: TextField(
                              controller: controllerMessage,
                              maxLines: 5,
                              decoration: InputDecoration(
                                  hintText: 'Message',
                                  labelText: 'How can we help you?',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),

                          //Send button
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.purple.shade700),
                              // set state for data picker in dialog
                              onPressed: (() {
                                Future.delayed(Duration.zero, () {
                                  final firstName = controllerFirstName.text;
                                  final lastName = controllerLastName.text;
                                  final email = controllerEmail.text;
                                  final msg = controllerMessage.text;
                                  provider.addQuestionInfo(AskModel(
                                      firstName: firstName,
                                      lastName: lastName,
                                      email: email,
                                      msg: msg));
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Container(
                                            height: 300.0,
                                            width: 200.0,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: Text(
                                                      'Data Berhasil dimasukan!',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('First Name : '),
                                                      Text(firstName),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('Last Name : '),
                                                      Text(lastName),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('Email : '),
                                                      Text(email),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('Message : '),
                                                      Expanded(child: Text(msg)),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20,),
                                                  Text('Data has been stored to your profile page, click here to directly see your history!'),
                                                  SizedBox(height: 20,),
                                                  ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                      primary: Colors.purple.shade600
                                                    ),
                                                    onPressed: (){
                                                    Navigator.push(context, MaterialPageRoute(
                                                      builder: (context){
                                                        return ProfilePage();
                                                      }));
                                                  }, child: Text('Profile Page'))
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                });
                              }),
                              child: Text('Send'))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
