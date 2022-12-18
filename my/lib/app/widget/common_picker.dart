import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonPicker {
  static Future<int?> showPicker(
      {BuildContext? context, List<String>? options, int? value}) {
    return showCupertinoModalPopup<int>(
        context: context!,
        builder: ((context) {
          var controller = FixedExtentScrollController(initialItem: value!);
          var result;
          return Container(
            color: Colors.white,
            height: 300,
            child: Column(children: [
              Container(
                height: 40,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: (() {
                            Navigator.of(context).pop();
                          }),
                          child: Text(
                            '取消',
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          )),
                      TextButton(
                          onPressed: (() {
                            Navigator.of(context).pop(result);
                          }),
                          child: Text(
                            '确定',
                            style: TextStyle(color: Colors.green, fontSize: 20),
                          ))
                    ]),
              ),
              Expanded(
                  child: CupertinoPicker(
                scrollController: controller,
                itemExtent: 32,
                onSelectedItemChanged: ((value) {
                  //ScrollEndNotification;
                  print(value);
                  
                    result = value;
                  
                }),
                children: options!.map((item) => Text(item)).toList(),
              ))
            ]),
          );
        }));
  }
}
