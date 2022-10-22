import 'package:flutter/material.dart';
import 'package:task_week1/models/login_model.dart';

class LoginProvider with ChangeNotifier{
  final List<LoginModel> _loginModel = [];
  List<LoginModel> get loginModel => _loginModel;

  void addLoginData (LoginModel loginModel) {
    _loginModel.add(loginModel);
    notifyListeners();
  }

  Future<void> removeData (LoginModel loginModel) async {
    await Future.delayed(Duration(seconds: 2));
    _loginModel.clear();
    notifyListeners();
  }

}