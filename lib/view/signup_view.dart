
import 'package:flutter/material.dart';
import 'package:mvvm_flutter_prac/res/components/roundedbutton.dart';
import 'package:mvvm_flutter_prac/utils/routes/routes_naMe.dart';
import 'package:mvvm_flutter_prac/utils/utils.dart';
import 'package:mvvm_flutter_prac/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget{
  State<SignupView> createState(){
    return _SignupState();
  }
}
class _SignupState extends State<SignupView>{
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
        title: Text("Signup"),
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
              RoundedButton(loading: authViewModel.getLoading,title: 'Signup', callback: (){
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
              SizedBox(
                height: 10,
              ),
              InkWell(
                child: Text("Already have an account? Login"),
                onTap: (){
                  Navigator.of(context).pushNamed(RoutesName.login);
                  },
              )
            ],
          )
      ),
    );
  }
}