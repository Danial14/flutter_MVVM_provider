
import 'package:mvvm_flutter_prac/model/UserModel.dart';
import '../../utils/routes/routes_naMe.dart';
import '../../view_model/user_view_Model.dart';
import 'package:flutter/material.dart';

class SplashServices{
  Future<UserModel> getUserData() async{
    return UserViewModel().getUser();
  }
  void checkAuthentication(BuildContext context) async{
    getUserData().then((val){
      if(val.token == null || val.token == ""){
        Navigator.of(context).pushNamed(RoutesName.login);
      }
      else{
        Navigator.of(context).pushNamed(RoutesName.hoMe);
      }
    }).onError((error, stackTrace){

    });
  }
}