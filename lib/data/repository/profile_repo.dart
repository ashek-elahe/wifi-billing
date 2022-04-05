import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:real_state/data/datasource/remote/dio/dio_client.dart';
import 'package:real_state/data/datasource/remote/exception/api_error_handler.dart';
import 'package:real_state/data/model/body/department_body.dart';
import 'package:real_state/data/model/body/designation_body.dart';
import 'package:real_state/data/model/response/base/api_response.dart';
import 'package:real_state/data/model/response/user_model.dart';
import 'package:real_state/utill/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepo{
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  ProfileRepo({@required this.dioClient, @required this.sharedPreferences});


  Future<ApiResponse> getUserInfo() async {
    try {
      UserInfoModel _userInfo = UserInfoModel(id: 1, image: Images.profile, name: 'Md. Kabir Hossain', phone: '12345678', email: 'kabir@email.com', address: '28/10 Block C, Mirpur');
      final response = Response(requestOptions: RequestOptions(path: ''), data: _userInfo, statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


}