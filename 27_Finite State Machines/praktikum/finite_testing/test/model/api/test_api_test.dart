import 'package:finite_testing/models/api/test_api.dart';
import 'package:finite_testing/models/test_model.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';

import 'test_api_test.mocks.dart';

@GenerateMocks([TestApi])
void main() {
  group('TestApi', () {
    TestApi testApi = MockTestApi();

    test('get all menu return data', () async {
      when(testApi.getData())
          .thenAnswer(
            (_) async => <TestModel>[TestModel(id: 1, name: 'a')]);
      var menuService = await TestApi.getData();
      expect(menuService.isNotEmpty, true);
    });
  });
}
