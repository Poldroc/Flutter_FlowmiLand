import 'package:flutter/material.dart';
import 'package:my/app/modules/login/textFieldContainer.dart';

class PasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const PasswordField({super.key, required this.onChanged, required this.controller});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
         controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: !showPassword,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20),
        suffixIcon: IconButton(
          icon: Icon(
            showPassword ? Icons.visibility : Icons.visibility_off,
          ),
          color: Colors.black54,
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
        ),
        border: InputBorder.none,
        hintText: "密码",
        hintStyle: TextStyle(fontSize: 15, color: Colors.grey, height: 2.5),
      ),
    ));
  }
}
