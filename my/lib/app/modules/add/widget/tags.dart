import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:my/app/colors/global.colors.dart';
import 'package:my/app/data/recommendList.dart';

import '../controllers/add_controller.dart';


 var c =Get.put(AddController());
class Tag extends StatefulWidget {
  const Tag({
    super.key,
  });

  @override
  State<Tag> createState() => _TagState();
}

class _TagState extends State<Tag> {
  _onDelete(index) {
    setState(() {
      c.values.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    //Get.lazyPut(() => AddController());
   var tagController = TextEditingController();
    //Get.find<AddController>();
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
          child: TagEditor(
              controller: tagController,
              length: c.values.length,
              delimiters: [',', ' '],
              hasAddButton: true,
              inputDecoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '标签:',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.grey),
              ),
              onTagChanged: (newValue) {
                setState(() {
                  c.values.add(newValue);
                  print(c.values.join());
                });
              },
              tagBuilder: (context, index) => _Chip(
                    index: index,
                    label: c.values[index],
                    onDeleted: _onDelete,
                  ))),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      labelStyle: TextStyle(color: GlobalColors.kPrimaryColor),
      deleteIcon: const Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
