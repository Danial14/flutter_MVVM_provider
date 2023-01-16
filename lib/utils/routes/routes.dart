import 'package:flutter/material.dart';
import 'package:mvvm_flutter_prac/utils/routes/routes_naMe.dart';
import 'package:mvvm_flutter_prac/view/home_screen.dart';
import 'package:mvvm_flutter_prac/view/login_screen.dart';

import '../../view/signup_view.dart';
import '../../view/splash_view.dart';


class Routes{
  static MaterialPageRoute generateRoute(RouteSettings settings){
    switch(settings.name!){
      case RoutesName.hoMe:
        return MaterialPageRoute(builder: (context){
          return HomeScreen();
        });
      case RoutesName.login:
        return MaterialPageRoute(builder: (context){
          return LoginView();
        });
      case RoutesName.signUp :
        return MaterialPageRoute(
          builder: (context){
            return SignupView();
          }
        );
      case RoutesName.splashScreen:
        return MaterialPageRoute(
          builder: (context){
            return SplashView();
          }
        );
      default:
        return MaterialPageRoute(
          builder: (context){
            return Center(
              child: Text("No route defined"),
            );
          }
        );
    }

  }
}