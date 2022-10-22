import 'package:flutter/material.dart';
import 'package:task_week1/models/question_model.dart';

class AskProvider with ChangeNotifier{
  final List<AskModel> _nanya = [];
  List<AskModel> get nanya => _nanya;

  void addQuestionInfo (AskModel nanya){
    _nanya.add(nanya);
    notifyListeners();
  }

  Future<void> removeQuestion (AskModel nanya) async {
    await Future.delayed(Duration(seconds: 1));
    _nanya.clear();
    notifyListeners();
  }
}