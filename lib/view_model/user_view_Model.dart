import 'package:flutter/material.dart';
import 'package:mvvm_flutter_prac/model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{
  Future<bool> saveUser(UserModel userModel) async{
    final SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setString("token", userModel.token!);
    notifyListeners();
    return true;
  }
  Future<UserModel> getUser() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userToken = sharedPreferences.get("token") as String?;
    return UserModel(token: userToken);
  }
  Future<bool> remove() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.clear();
  }
}
