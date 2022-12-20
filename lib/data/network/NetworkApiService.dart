import 'dart:convert';
import 'dart:io';

import 'package:mvvm_flutter_prac/data/app_exception.dart';
import 'package:mvvm_flutter_prac/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApi extends BaseApiServices{
  Future<dynamic> getGetApiResponse(String url) async{
    dynamic jsonResponse;
    try{
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    }on SocketException{
      throw FetchDataException("No internet");
    }
    return jsonResponse;
  }
  Future<dynamic> getPostApiResponse(String url) async{
    try{
      final response = await http.post(Uri.parse(url)).timeout(Duration(seconds: 10));
    }on SocketException{
      throw FetchDataException("No internet");
    }
  }
  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException("Error while occured coMMunicating with server and status code is ${response.statusCode}");

    }
  }
}