import 'package:flutter/material.dart';
import 'package:mvvm_flutter_prac/res/colors.dart';

class RoundedButton extends StatelessWidget {
  String title;
  VoidCallback callback;
  bool loading;
  RoundedButton({
    required this.title,
    required this.callback,
    required this.loading
});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.green,
        ),
        child: Center(
          child: loading ? CircularProgressIndicator(color: Colors.white,) : Text(title),
        ),
      ),
    );
  }
}
