import 'package:dio/dio.dart';
import 'package:finite_testing/models/test_model.dart';

class TestApi {
  static Future<List<TestModel>> getData() async {
    final response = await Dio().get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods');

    List<TestModel> testModel = (response.data as List)
        .map((e) => TestModel(id: e['id'], name: e['name']))
        .toList();

    return testModel;
  }
}
