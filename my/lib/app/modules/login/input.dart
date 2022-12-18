import 'package:flutter/material.dart';
import 'package:my/app/modules/login/textFieldContainer.dart';

class InputField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const InputField({super.key, required this.onChanged, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
          controller:controller ,
      onChanged: onChanged,
      style: const TextStyle(fontSize: 20),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.only(left: 20),
        border: InputBorder.none,
        hintText: "手机号码/电子邮箱/用户名",
        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
      ),
    ));
  }
}
