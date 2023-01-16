import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter_prac/model/UserModel.dart';
import 'package:mvvm_flutter_prac/repository/auth_repository.dart';
import 'package:mvvm_flutter_prac/utils/routes/routes_naMe.dart';
import 'package:mvvm_flutter_prac/utils/utils.dart';
import 'package:mvvm_flutter_prac/view_model/user_view_Model.dart';
import 'package:provider/provider.dart';

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
  AuthViewModel(BuildContext context){
  }
  Future<void> loginApi(dynamic data, BuildContext context) async{
    setLoading = true;
    _authRepository.loginApi(data).then((value){
      setLoading = false;
      Utils.flushBarErrorMessage("Success login", context);
      Timer(Duration(seconds: 3), (){
        Provider.of<UserViewModel>(context, listen: false).saveUser(UserModel.fromJson(value));
        Navigator.of(context).pushNamed(RoutesName.hoMe);
      });
    }).onError((error, stackTrace){
      setLoading = false;
      print(stackTrace.toString());
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
  Future<void> signupApi(dynamic data, BuildContext context) async{
    setLoading = true;
    _authRepository.signupApi(data).then((value){
      setLoading = false;
      Utils.flushBarErrorMessage("Success signup", context);
      Timer(Duration(seconds: 3), (){
        Navigator.of(context).pushNamed(RoutesName.hoMe);
      });
    }).onError((error, stackTrace){
      setLoading = false;
      print(stackTrace.toString());
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}