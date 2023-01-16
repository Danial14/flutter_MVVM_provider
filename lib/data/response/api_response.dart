import 'package:mvvm_flutter_prac/data/response/status.dart';

class ApiResponse<T>{
  Status? status;
  T? data;
  String? Message;
  ApiResponse(this.status, this.data, this.Message);
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.coMpleted(T data){
    status = Status.COMPLETED;
    this.data = data;
  }
  ApiResponse.error(this.Message) : status = Status.ERROR;
  String toString(){
    return "Status : $status\n Message : $Message \n Data : $data";
  }
}