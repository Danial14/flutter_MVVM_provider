
import 'package:flutter/material.dart';
import 'package:mvvm_flutter_prac/res/components/roundedbutton.dart';
import 'package:mvvm_flutter_prac/utils/routes/routes.dart';
import 'package:mvvm_flutter_prac/utils/utils.dart';
import 'package:provider/provider.dart';

import '../utils/routes/routes_naMe.dart';
import '../view_model/auth_view_model.dart';

class LoginView extends StatefulWidget{
  @override
  State<LoginView> createState() {
    return _LoginViewState();
  }
}
class _LoginViewState extends State<LoginView>{
  TextEditingController _eMailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _eMailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  ValueNotifier<bool> _valueNotifier = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _eMailController,
              focusNode: _eMailFocusNode,
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.email)
              ),
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (val){
                Utils.changeFocus(context, _passwordFocusNode, _eMailFocusNode);
              },
            ),
            ValueListenableBuilder(
              builder: (ctx, value, child){
                print("value notifier $value");
                return TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(child: _valueNotifier.value ? Icon(Icons.visibility_off) : Icon(Icons.visibility), onTap: (){
                        _valueNotifier.value = !_valueNotifier.value;
                      },
                      )
                  ),
                  obscureText: _valueNotifier.value,
                  obscuringCharacter: "*",

                );
              },
              valueListenable: _valueNotifier,
            ),
            SizedBox(
              height: 30
            ),
            RoundedButton(loading: authViewModel.getLoading,title: 'Login', callback: (){
              print("email ${_eMailController.text}");
              if(_eMailController.text.isEmpty || !(_eMailController.text.contains("@"))){
                Utils.flushBarErrorMessage("Please enter valid eMail", context);
              }
              else if(_passwordController.text.isEmpty){
                Utils.showToastMessage("Please enter valid password");
              }
              else if(_passwordController.text.length < 6){
                Utils.flushBarErrorMessage("Please enter password of atleast 6 digit", context);
              }
              else{
                authViewModel.loginApi({
                  "email" : _eMailController.text.toString(),
                  "password" : _passwordController.text.toString()
                }, context);
                Utils.showToastMessage("Success");
              }
            },),
            SizedBox(height: 10,),
            InkWell(
              child: Text("Dont have an account? Signup"),
              onTap: (){
                Navigator.of(context).pushNamed(RoutesName.signUp);
              },
            )
          ],
        )
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _eMailController.dispose();
    _passwordController.dispose();
    _eMailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _valueNotifier.dispose();
  }
}
