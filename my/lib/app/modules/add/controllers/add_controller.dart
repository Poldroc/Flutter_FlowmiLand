import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/src/multipart_file.dart' as MultipartFile;
import 'package:dio/src/form_data.dart' as FormData;

import '../../../../main.dart';
import '../../../../scoped_model/auth.dart';
import '../../../../utils/dio_http.dart';
import '../../../../utils/http_helper.dart';
import '../../../../utils/scopoed_model_helper.dart';
import '../landManage/Land_manageView.dart';

enum LoadingStatus {
  loading,
  success,
  failed,
}

BuildContext context = navigatorKey.currentState!.overlay!.context;

class AddController extends GetxController {
  final informationController = TextEditingController();

  final titleController = TextEditingController();

  final addressController = TextEditingController();

  final priceController = TextEditingController();

  final areaController = TextEditingController();

  final typeController = TextEditingController();

  final ageLimitController = TextEditingController();

  List values = [];

  List<XFile> files = [];

  //AddController(tagState);

//农用地
  submit() async {
    LoadingStatus _loadingStatus = LoadingStatus.loading;
  EasyLoading.show(status: "上传中");
    try {
      ScopedModelHelper.getModel<AuthModel>(context).userInfo!.uid;
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: "请先登录");
    }
    var sell_id = ScopedModelHelper.getModel<AuthModel>(context).userInfo!.uid;
    var token = ScopedModelHelper.getModel<AuthModel>(context).token;
    var describe = informationController.text;
    var title = titleController.text;
    var address = addressController.text;
    var price = priceController.text;
    var area = areaController.text;
    var land_type = typeController.text;
    var ageLimit = ageLimitController.text;
    var tag = values.join("-");
    print("tag:" + tag);
    List<dynamic> imgListUpload = [];
    //List<dynamic> imgListUpload = [];
    //String path=
    //if (files.length >= 2) {
      files.forEach((element) async {
        print(element.path);
        //遍历图片 加入到dio的批量文件里面
        imgListUpload.add(MultipartFile.MultipartFile.fromFile(
          element.path,
          filename: element.name,
        ));
      });
    //} //else {
      //Fluttertoast.showToast(msg: "请上传至少两张照片");
    //}

    FormData.FormData formData = FormData.FormData();
    //Map<String, String> fields = {
    //'type': files.type,
    //'content': message.content,
    //'communication': message.communication,
    //};
    //formData.fields.addAll(iterable)
    //for (int i = 0; i < files.length; i++) {

    print("PATH:  " + files[0].path);
    formData = FormData.FormData.fromMap({
      "title": title,
      "describe": describe,
      "price": price,
      "address": address,
      "token": token,
      "uid": sell_id,
      //'images': _imgListUpload, //批量的图片
      "tag": tag,
      "land_type": land_type,
      "area": area,
    });
    for (int i = 0; i < files.length; i++) {
      formData.files.addAll(
        [
          MapEntry(
            'images',
            MultipartFile.MultipartFile.fromFileSync(files[i].path,
                filename: files[i].name),
          ),
        ],
      );
    }
    var url = HttpHelper.Upload_Land;
    print(token + "asdasdas dasd" + sell_id.toString());
    Dio dio = new Dio();

    var res = await Dio().post(url,
        data: formData,
        options: Options(
            //followRedirects: false,
            // will not throw errors
            validateStatus: (status) => true,
            //contentType: "multipart/form-data",
            responseType: ResponseType.json
            //responseType: ResponseType.json,
            ));
    //var res=await DioHttp.of(context).postFormData(url,formData);
    try {
      print('res:' + res.toString());
      var resMap = json.decode(res.toString());
      int status = resMap['code'];
      //print("alkfj" + resMap);
      String description = resMap['errorMsg'];
     
      
     
      if (status == 1) {
        _loadingStatus = LoadingStatus.success;
        EasyLoading.dismiss();
        Fluttertoast.showToast(msg: "成功");
        Get.off(() => LandSettingTabbarView());
      } else {
        Fluttertoast.showToast(
          msg: description,
        );
      }
    } on Exception catch (e) {}
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    informationController.dispose();
    titleController.dispose();
    addressController.dispose();
    priceController.dispose();
    areaController.dispose();
    typeController.dispose();
    ageLimitController.dispose();
    values.clear();
    files.clear();

    super.onClose();
  }
}
