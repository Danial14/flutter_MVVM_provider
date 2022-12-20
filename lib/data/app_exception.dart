class AppException implements Exception{
  final _Message;
  final _prefix;
  AppException([this._Message, this._prefix]);
  String toString(){
    return "$_prefix$_Message";
  }
}
class FetchDataException extends AppException{
  FetchDataException([String? Message]) : super(Message, "Error during coMMunication");
}
class BadRequestException extends AppException{
  BadRequestException([String? Message]) :
    super(Message, "invalid request");
}
class UnauthorizedException extends AppException{
  UnauthorizedException([String? Message]) :
      super(Message, "Unauthorized request");
}
class InvalidInputException extends AppException{
  InvalidInputException([String? Message]) :
      super(Message, "Invalid input");
}