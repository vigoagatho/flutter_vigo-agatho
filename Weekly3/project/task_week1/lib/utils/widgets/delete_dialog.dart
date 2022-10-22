import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_week1/models/question_model.dart';
import 'package:task_week1/providers/question_provider.dart';
import 'package:task_week1/screens/service.dart';

class DeleteDialog {
  Future<void> showDeleteDialog(BuildContext context) async {
    final provider = Provider.of<AskProvider>(context, listen: false);
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Are you sure want to delete the question history?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    provider.removeQuestion(AskModel());
                    Future.delayed(Duration(seconds: 2));
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ContactUs()));
                  },
                  child: Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No')),
            ],
          );
        });
  }
  
}