import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:real_state/data/datasource/remote/exception/api_error_handler.dart';
import 'package:real_state/data/model/body/leaveType.dart';
import 'package:real_state/data/model/response/base/api_response.dart';

class PackageRepo {

  Future<ApiResponse> getPackageTypeList(BuildContext context) async {
    try {
      List<PackageTypeModel> _clientTypeList = [
        PackageTypeModel(id: 0, leaveType: 'Economic'),
        PackageTypeModel(id: 1, leaveType: 'Basic'),
        PackageTypeModel(id: 2, leaveType: 'Family'),
        PackageTypeModel(id: 3, leaveType: 'Bachelor'),
        PackageTypeModel(id: 4, leaveType: 'Fast'),
        PackageTypeModel(id: 5, leaveType: 'Super Fast'),
      ];
      Response response = Response(requestOptions: RequestOptions(path: ''), data: _clientTypeList, statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }



  Future<ApiResponse> getPackageNameList(BuildContext context) async {
    try {
      List<PackageTypeModel> _clientTypeList = [
        PackageTypeModel(id: 0, leaveType: '2Mbps'),
        PackageTypeModel(id: 1, leaveType: '5Mbps'),
        PackageTypeModel(id: 2, leaveType: '8Mbps'),
        PackageTypeModel(id: 3, leaveType: '10Mbps'),
        PackageTypeModel(id: 4, leaveType: '15Mbps'),
        PackageTypeModel(id: 5, leaveType: '20Mbps'),
      ];
      Response response = Response(requestOptions: RequestOptions(path: ''), data: _clientTypeList, statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}