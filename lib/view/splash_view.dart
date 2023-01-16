import 'package:flutter/material.dart';
import 'package:mvvm_flutter_prac/view/services/splash_services.dart';

class SplashView extends StatefulWidget{
  @override
  State<SplashView> createState() {
    return _SplashState();
  }
}
class _SplashState extends State<SplashView>{
  final SplashServices _splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      _splashServices.checkAuthentication(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text("Splash screen")
        ],
      ),
    );
  }
}