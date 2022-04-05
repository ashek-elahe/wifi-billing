import 'package:real_state/data/model/response/base/api_response.dart';
import 'package:real_state/data/model/response/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnBoardingProvider with ChangeNotifier {

  List<OnBoardingModel> _onBoardingList = [];

  List<OnBoardingModel> get onBoardingList => _onBoardingList;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  changeSelectIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
