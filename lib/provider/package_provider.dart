import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:real_state/data/model/body/leaveType.dart';
import 'package:real_state/data/model/body/leave_body.dart';
import 'package:real_state/data/model/response/package_model.dart';
import 'package:real_state/data/model/response/base/api_response.dart';
import 'package:real_state/data/model/response/response_model.dart';
import 'package:real_state/data/repository/package_repo.dart';
import 'package:real_state/helper/sql_helper.dart';

class PackageProvider with ChangeNotifier {
  final PackageRepo packageRepo;

  PackageProvider({@required this.packageRepo});

  List<PackageModel> _packageList = [];
  List<PackageModel> get packageList => _packageList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  Future refreshNote() async{
    _isLoading = true;
    notifyListeners();
    _packageList = await DatabaseProvider.db.getPackageList();
    _isLoading = false;
    notifyListeners();
  }

  Future sort(bool ascending, bool price) async{
    _isLoading = true;
    notifyListeners();
    _packageList = await DatabaseProvider.db.sortPackageList(ascending, price);
    _isLoading = false;
    notifyListeners();
  }

  Future searchQuery(String query) async{
    _isLoading = true;
    notifyListeners();
    _packageList = await DatabaseProvider.db.searchQuery(query);
    _isLoading = false;
    notifyListeners();
  }

  addItem(PackageModel packageModel){
    _packageList.add(packageModel);
    notifyListeners();
  }
  updateItem(PackageModel packageModel, int index){
    _packageList[index] = packageModel;
    notifyListeners();
  }

  removeItem(int index){
    _packageList.removeAt(index);
    notifyListeners();
  }
  List<PackageTypeModel> _packageTypeList = [];
  List<PackageTypeModel> get packageTypeList => _packageTypeList;

  int _packageIndex = -1;
  int get packageIndex => _packageIndex;

  void initPackageTypeList(BuildContext context) async {
    ApiResponse apiResponse = await packageRepo.getPackageTypeList(context);
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      _packageTypeList.clear();
      _packageTypeList.addAll(apiResponse.response.data);
      notifyListeners();
    } else {
      print(apiResponse.error.toString());
    }
  }

  void setPackageTypeIndex(int index, bool notify) {
    _packageIndex = index;
    if (notify) {
      notifyListeners();
    }
  }



  //PackageName
  List<PackageTypeModel> _packageNameList = [];
  List<PackageTypeModel> get packageNameList => _packageNameList;

  int _packageNameIndex = -1;
  int get packageNameIndex => _packageNameIndex;

  void initPackageNameList(BuildContext context) async {
    ApiResponse apiResponse = await packageRepo.getPackageNameList(context);
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      _packageNameList.clear();
      _packageNameList.addAll(apiResponse.response.data);
      notifyListeners();
    } else {
      print(apiResponse.error.toString());
    }
  }

  void setPackageNameIndex(int index, bool notify) {
    _packageNameIndex = index;
    if (notify) {
      notifyListeners();
    }
  }
}