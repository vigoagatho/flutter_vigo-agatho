import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:api_implement/models/post_model.dart';
import 'package:api_implement/msc/card.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:api_implement/msc/service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PostModel? postModel;
  final nameController = TextEditingController();
  final jobController = TextEditingController();
  // final Dio dio = Dio();

  //function dio




  // Future fetchUsers() async {
  //   try {
  //     final Response response = await dio.get('https://reqres.in/api/users');
  //     debugPrint(response.data.toString());
  //     return response.data;
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  // Future createUser({
  //   required String name,
  //   required String job,
  // }) async {
  //   try {
  //     final Response response = await dio.post('https://reqres.in/api/users', data: {'name':name, 'job':job} );
  //     debugPrint(response.data.toString());
      
  //     final PostModel _postModel = PostModel.fromJson(response.data);
  //     return response.data;
  //   }
  //   catch(e){
  //     throw Exception(e.toString());
  //   }
  // }

  // Future updateUser({
  //   required String name,
  //   required String job
  // }) async {
  //   try{
  //     final Response response = await dio.put('https://reqres.in/api/users/4');
  //     debugPrint(response.data.toString());

  //     return response.data;
  //   }
  //   catch(e){
  //     throw Exception(e.toString());
  //   }
  // }

  // Future deleteUser() async {
  //   try{
  //     final Response response = await dio.delete('https://reqres.in/api/users/4');
  //     debugPrint(response.data.toString());
  //     return response.data;
  //   }
  //   catch(e){
  //     throw Exception(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API JSON'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: 'Name',
                  label: const Text('Name'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: jobController,
              decoration: InputDecoration(
                  hintText: 'Job',
                  label: const Text('Job'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: const Text('Result', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          postModel != null ? ModelCard(postModel: postModel!) : const Text('No Data'),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              // mainAxisSpacing: 7,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple.shade800),
                      onPressed: () async {
                        PostModel? result = await DataServices.getUserData();

                        if(result != null){
                          setState(() {
                            postModel = result;
                          });
                        }
                      },
                      child: const Text('Get')),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple.shade800),
                      onPressed: () async {
                        PostModel? result = await DataServices.createUser(nameController.text, jobController.text);

                        if(result != null){
                          setState(() {
                            postModel = result;
                          });
                        }
                      },
                      child: const Text('Post')),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple.shade800),
                      onPressed: () {},
                      child: const Text('Put')),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple.shade800),
                      onPressed: () {},
                      child: const Text('Delete')),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
