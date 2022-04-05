
import 'package:dio/dio.dart';
import 'package:real_state/data/datasource/remote/exception/api_error_handler.dart';
import 'package:real_state/data/model/response/customer_model.dart';
import 'package:real_state/data/model/response/base/api_response.dart';
import 'package:real_state/utill/images.dart';

class CustomerRepo {

  // Future<ApiResponse> getCustomerList() async {
  //   try {
  //     List<CustomerModel> _getCustomerList = [
  //       CustomerModel(id: 0, name: 'Md. Kabir Hossain', image: Images.profile, email: 'kabir@gmail.com', phone: 01787816047, address: '28/10 C Block, Mirpur', type: "Economic"),
  //       CustomerModel(id: 1, name: 'Ashek Elahe', image: Images.profile, email: 'ashek@gmail.com', phone: 018875466047, address: '28/10 C Block, Mirpur', type: "Basic"),
  //       CustomerModel(id: 2, name: 'Abu Taher Molla', image: Images.profile, email: 'taher@gmail.com', phone: 01743854546, address: 'Gazipur', type: "Family"),
  //       CustomerModel(id: 3, name: 'Md. Tayeb Hossain', image: Images.profile, email: 'tayeb@gmail.com', phone: 0184535623, address: 'Banani, Dhaka', type: "Bachelor"),
  //       CustomerModel(id: 4, name: 'Md. Rasel Mia', image: Images.profile, email: 'rasel@gmail.com', phone: 017456326546, address: 'Uttora, Dhaka', type: "Fast"),
  //       CustomerModel(id: 5, name: 'Daud Al-Islam', image: Images.profile, email: 'daud@gmail.com', phone: 013658684345, address: 'Feni, Bangladesh', type: "Super Fast"),
  //
  //        ];
  //     final response= Response( requestOptions:  RequestOptions(path: ''), data: _getCustomerList, statusCode: 200);
  //     return ApiResponse.withSuccess(response);
  //   }catch (e){
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }

}
