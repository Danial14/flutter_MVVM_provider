import 'package:mvvm_flutter_prac/data/response/status.dart';

class ApiResponse<T>{
  Status? status;
  T? data;
  String? Message;
  ApiResponse(this.status, this.data, this.Message);
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.coMpleted(){
    status = Status.COMPLETED;
  }
  ApiResponse.error() : status = Status.ERROR;
  String toString(){
    return "Status : $status\n Message : $Message \n Data : $data";
  }
}