
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:my/utils/config.dart';
class DioHttp {
  late Dio? client=null; //实例化dio
  late BuildContext? context=null;
  static DioHttp of(BuildContext context) {
    return DioHttp._internal(context);
  }
  DioHttp._internal(BuildContext context) {
    if (client == null || context != this.context) {
      this.context = context;
      var options = BaseOptions(
          //全局选项
          baseUrl: Config.BaseUrl,
          connectTimeout: 1000 * 100,
          receiveTimeout: 1000 * 300,
          extra: {'context': context});
      client = Dio(options);
    }
  }
  Future<Response<Map<String, dynamic>>> get(String path,
      [Map<String, dynamic>? params, String? token]) async {
    //token传递登录动态信息
    var options = Options(headers: {'Authorization': token});
    return await client!.get(path, queryParameters: params, options: options);
  }//农用地

  Future<Response<Map<String, dynamic>>> post(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return await client!.post(path, data: params, options: options);
  } 
//图片上传
  Future<Response<Map<String, dynamic>>> postFormData(String path,
      [FormData? params, String? token]) async {
    var options = Options(
        contentType: ContentType.parse('multipart/form-data').toString(),
        headers: {'Authorization': token});
    return await client!.post(path, data: params, options: options);
  }
}
