import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my/app/modules/login/input.dart';
import 'package:my/app/modules/login/textFieldContainer.dart';

class RoundedInputField extends StatelessWidget {
  final  TextEditingController controller;
  final String hintText;
  //final String labelText;
  final bool obscureText;
  final ValueChanged<String> onChanges;
  const RoundedInputField(
      {super.key,
      required this.hintText,
      required this.onChanges,
      //required this.labelText,
      required this.obscureText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanges,
      decoration: InputDecoration(   
          //contentPadding: EdgeInsets.all(50),
          //labelText: labelText,
          labelStyle: TextStyle(color: Colors.black),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
          border: InputBorder.none),
    )); 
  }
}
