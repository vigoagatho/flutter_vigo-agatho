import 'package:finite_testing/models/api/test_api.dart';
import 'package:finite_testing/models/test_model.dart';
import 'package:flutter/material.dart';

enum MenuState {
  none,
  loading,
  error,
}

class MenuService with ChangeNotifier {
  MenuState _state = MenuState.none;
  MenuState get state => _state;

  List<TestModel> _menu = [];
  List<TestModel> get menu => _menu;

  changeState(MenuState s) {
    _state = s;
    notifyListeners();
  }

  getMenu() async {
    changeState(MenuState.loading);
    try {
      final m = await TestApi().getData();
      _menu = m;
      notifyListeners();
      changeState(MenuState.none);
    } catch (e) {
      changeState(MenuState.error);
    }
  }


}
