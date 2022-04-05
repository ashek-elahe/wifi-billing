import 'package:flutter/cupertino.dart';
import 'package:real_state/data/model/response/customer_model.dart';
import 'package:real_state/data/model/response/base/api_response.dart';
import 'package:real_state/data/repository/customer_repo.dart';
import 'package:flutter/material.dart';
import 'package:real_state/helper/user_helper.dart';

class CustomerProvider extends ChangeNotifier {
  final CustomerRepo attendanceRepo;
  CustomerProvider({@required this.attendanceRepo});

  // List<CustomerModel> _attendanceList = [];
  // List<CustomerModel> get attendanceList => _attendanceList;
  //
  // Future<void> getCustomerList(BuildContext context) async {
  //   ApiResponse apiResponse = await attendanceRepo.getCustomerList();
  //   if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
  //     _attendanceList = [];
  //     _attendanceList.addAll(apiResponse.response.data);
  //     notifyListeners();
  //   } else {
  //     print(apiResponse.error.toString());
  //   }
  // }


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<CustomerModel> _customerList = [];
  List<CustomerModel> get customerList => _customerList;

  Future refreshNote() async{
    _isLoading = true;
    notifyListeners();
    _customerList = await DatabaseProvider.db.getCustomerList();
    _isLoading = false;
    notifyListeners();
  }


  Future sort(bool ascending,) async{
    _isLoading = true;
    notifyListeners();
    _customerList = await DatabaseProvider.db.sortPackageList(ascending);
    _isLoading = false;
    notifyListeners();
  }

  Future searchQuery(String query) async{
    _isLoading = true;
    notifyListeners();
    _customerList = await DatabaseProvider.db.searchQuery(query);
    _isLoading = false;
    notifyListeners();
  }

  addItem(CustomerModel customerModel){
    _customerList.add(customerModel);
    notifyListeners();
  }
  updateItem(CustomerModel customerModel, int index){
    _customerList[index] = customerModel;
    notifyListeners();
  }

  removeItem(int index){
    _customerList.removeAt(index);
    notifyListeners();
  }

}