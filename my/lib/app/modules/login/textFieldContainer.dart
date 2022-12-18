import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  
  final Widget child;
  const TextFieldContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Opacity(
        opacity: 1,
        child: Container(

          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          width: size.width * 0.7,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(
              color: Colors.black.withOpacity(0.3),
              //blurRadius: 
            )],
              color: Colors.white, borderRadius: BorderRadius.circular(35)),
          child: child,
          
        ));
  }
}
