
import 'package:flutter/material.dart';
import 'package:mvvm_flutter_prac/repository/auth_repository.dart';
import 'package:mvvm_flutter_prac/utils/routes/routes_naMe.dart';
import 'package:mvvm_flutter_prac/utils/utils.dart';

class AuthViewModel with ChangeNotifier{
  final AuthRepository _authRepository = AuthRepository();
  bool _loading = false;
  bool get getLoading{
    return _loading;
  }
  void set setLoading(bool loading){
    _loading = loading;
    notifyListeners();
  }
  late BuildContext _context;
  AuthViewModel(BuildContext context){
    _context = context;
  }
  Future<void> loginApi(dynamic data, BuildContext context) async{
    setLoading = true;
    _authRepository.loginApi(data).then((value){
      setLoading = false;
      Utils.flushBarErrorMessage("Success login", context);
      Navigator.of(context).pushNamed(RoutesName.hoMe);
    }).onError((error, stackTrace){
      setLoading = false;
      print(stackTrace.toString());
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}