import 'package:api_implement/models/post_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class DataServices {
  static Future<PostModel?> getUserData() async {
    try {
      final Response response = await Dio().get('https://reqres.in/api/users');
      debugPrint(response.data.toString());
      if (response.statusCode == 201) {
        return PostModel(
            // id: response.data['data']['id'],
            name: response.data['name'].toString(),
            job: response.data['job'].toString());
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<PostModel?> createUser(String name,String job) async {
    try{
      var response = await Dio().post('https://reqres.in/api/users', data: {
        'name': name,
        'job': job
      });

      if (response.statusCode==201){
        return PostModel(name: response.data['name'], job: response.data['job']);
      }
      return null;
    }
    catch(e){
      throw Exception(e.toString());
    }
  }

  static Future<PostModel?> updateUser(String name, String job) async{
    try{
      var response = await Dio().put('https://reqres.in/api/users/4', 
      data: {
        'name': name,
        'job' : job
      }
      );

      if(response.statusCode==200){
        return PostModel(name: response.data['name'], job: response.data['job']);
      }

      return null;
    }
    catch(e){
      throw Exception(e.toString());
    }
  }

  static Future<PostModel?> deleteUser() async{
    try{
      var response = await Dio().delete('https://reqres.in/api/users/4');
      if(response.statusCode==204){
        return PostModel(name: response.data, job: response.data);
      }

      return null;
    }
    catch(e){
      throw Exception(e.toString());
    }
  }
}
