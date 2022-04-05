
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:real_state/data/model/response/base/api_response.dart';
import 'package:real_state/data/model/response/response_model.dart';
import 'package:real_state/data/repository/auth_repo.dart';


class AuthProvider with ChangeNotifier {
  final AuthRepo authRepo;
  AuthProvider({@required this.authRepo});

  bool _isLoading = false;
  bool _firstTimeConnectionCheck = true;
  bool get firstTimeConnectionCheck => _firstTimeConnectionCheck;
  bool get isLoading => _isLoading;




  void setFirstTimeConnectionCheck(bool isChecked){
    _firstTimeConnectionCheck = isChecked;
  }

  // for login section
  String _loginErrorMessage = '';
  String get loginErrorMessage => _loginErrorMessage;

  Future<ResponseModel> login(String email, String password) async {
    _isLoading = true;
    _loginErrorMessage = '';
    notifyListeners();
    ApiResponse apiResponse = await authRepo.login(email: email, password: password);
    ResponseModel responseModel;
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      Map map = apiResponse.response.data;
      String token = map["access_token"];
      authRepo.saveUserToken(token);
      responseModel = ResponseModel(true, 'successful');
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      print(errorMessage);
      _loginErrorMessage = errorMessage;
      responseModel = ResponseModel(false, errorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  // for Remember Me Section
  bool _isActiveRememberMe = false;

  bool get isActiveRememberMe => _isActiveRememberMe;

  toggleRememberMe() {
    _isActiveRememberMe = !_isActiveRememberMe;
    notifyListeners();
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  Future<bool> clearSharedData() async {
    return await authRepo.clearSharedData();
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }

  String getUserEmail() {
    return authRepo.getUserEmail() ?? "";
  }

  String getUserPassword() {
    return authRepo.getUserPassword() ?? "";
  }

  Future<bool> clearUserEmailAndPassword() async {
    return authRepo.clearUserNumberAndPassword();
  }

  String getUserToken() {
    return authRepo.getUserToken();
  }

  Future<bool> removeSharedData() {
    return authRepo.removeSharedData();
  }

}
