import 'package:mvvm_flutter_prac/data/network/BaseApiServices.dart';
import 'package:mvvm_flutter_prac/data/network/NetworkApiService.dart';
import 'package:mvvm_flutter_prac/res/appurls.dart';

class AuthRepository{
  BaseApiServices _apiServices = NetworkApi();
  Future<dynamic> loginApi(dynamic data) async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
  }
  catch(e){
      throw e;
  }
  }
  Future<dynamic> signupApi(dynamic data) async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registrationEndPoint, data);
      return response;
    }
    catch(e){
      throw e;
    }
  }
}