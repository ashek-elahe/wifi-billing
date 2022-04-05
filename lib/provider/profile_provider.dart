
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:real_state/data/model/body/department_body.dart';
import 'package:real_state/data/model/body/designation_body.dart';
import 'package:real_state/data/model/response/base/api_response.dart';
import 'package:real_state/data/model/response/base/error_response.dart';
import 'package:real_state/data/model/response/response_model.dart';
import 'package:real_state/data/model/response/user_model.dart';
import 'package:real_state/data/repository/profile_repo.dart';
import 'package:real_state/helper/api_checker.dart';

class ProfileProvider with ChangeNotifier {
  final ProfileRepo profileRepo;
  ProfileProvider({@required this.profileRepo});


  bool _isLoading = false;
  String _clientErrorMessage = '';
  bool get isLoading => _isLoading;
  String get clientErrorMessage => _clientErrorMessage;

  int _profileIndex = 0;
  int get profileIndex => _profileIndex;


  UserInfoModel _userInfoModel;

  UserInfoModel get userInfoModel => _userInfoModel;

  Future<ResponseModel> getUserInfo(BuildContext context) async {
    ResponseModel _responseModel;
    ApiResponse apiResponse = await profileRepo.getUserInfo();
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _userInfoModel = apiResponse.response.data;
      _responseModel = ResponseModel(true, 'successful');
    } else {
      String errorMessage;
      if (apiResponse.response.data["message"] is String)
      {
        errorMessage = apiResponse.response.data["message"].toString();
      } else {
        ErrorResponse errorResponse = apiResponse.response.data["message"];
        errorMessage = errorResponse.errors[0].message;
      }
      print(errorMessage);
      _responseModel = ResponseModel(false, errorMessage);
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
    return _responseModel;
  }


  Future<ResponseModel> updateUserInfo(UserInfoModel updateUserModel, String password, File file, String token) async {
    _userInfoModel = updateUserModel;
    ResponseModel _responseModel = ResponseModel(true, 'Updated');
    notifyListeners();
    return _responseModel;
  }

  void changeButton(int index){
    _profileIndex = index;
    notifyListeners();
  }


}
