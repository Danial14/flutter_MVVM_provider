
import 'package:flutter/material.dart';

import '../utils/routes/routes_naMe.dart';
import '../utils/utils.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}
class _LoginScreenState extends State<LoginScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text("Click"),
          onPressed: (){
            //Navigator.of(context).pushNamed(RoutesName.hoMe);
            //Utils.showToastMessage("Click Me");
            Utils.flushBarErrorMessage("No internet", context);
          },
        ),
      ),
    );
  }
}