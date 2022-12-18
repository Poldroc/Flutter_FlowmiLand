import 'package:flutter/cupertino.dart';
import 'package:my/app/modules/login/body.dart';

import 'package:my/utils/store.dart';
import 'package:my/utils/string_is_null_or_empty.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/user_info.dart';

class AuthModel extends Model {
  String _token = '';
  UserInfo? _userInfo;

  String get token => _token;
  UserInfo? get userInfo => _userInfo;

  bool get isLogin => _token is String && _token != '';

  initApp(token,userdata) async {
    Store store = await Store.getInstance(); //获得store实例
    String token = await store.getString(StoreKeys.token);
    print('init');
    if (!stringIsNullOrEmpty(token)) {
      login(token, userdata);
    }
    notifyListeners();
  }

  void login(String token, userdata) {
    print('login');
    _token = token;
    Map<String, dynamic> user = userdata;
    var userInfo = UserInfo?.fromJson(user);
    _userInfo = userInfo;
    print("ddd");
    print(_userInfo);
    print(user);

    notifyListeners();
  }

  void logout() {
    _token = '';
    _userInfo = null ;
    notifyListeners();
  }
}
