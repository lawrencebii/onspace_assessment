import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../utils/format_date.dart';

enum option {
  ALL,
  PPLE,
  ITEMS,
}

class NavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  get selectedIndex => _selectedIndex;
  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  option _selectedOption = option.ALL;
  option get selectedOption => _selectedOption;
  void selectOption(option) {
    _selectedOption = option;
    notifyListeners();
  }

  String _currentTime = formatTimeToAMPM(DateTime.now());
  get currentTime => _currentTime;
  void updateCurrentTime() {
    Timer.periodic(Duration(seconds: 10), (Timer t) {
      _currentTime = formatTimeToAMPM(DateTime.now());
    });
  }
}
