import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:my/app/colors/global.colors.dart';
import 'package:my/app/modules/home/widget/searchPage/filter_bar/index.dart';
import 'package:my/app/modules/splash_view.dart';
import 'package:my/scoped_model/auth.dart';
import 'package:my/scoped_model/room_filter.dart';
import 'package:my/utils/store.dart';

import 'package:scoped_model/scoped_model.dart';

import 'app/routes/app_pages.dart';
import './app/modules/tabs/tab.dart';

void main()  {
  
  runApp(const App());
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AuthModel>(
        model: AuthModel(),
        child: ScopedModel<FilterBarModel>(
            model: FilterBarModel(),
            child: GetMaterialApp(
              navigatorKey: navigatorKey,

              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: AppBarTheme(color: GlobalColors.kPrimaryColor),
                primaryColor: GlobalColors.kPrimaryColor,
              ),
              home: SplashView(),
              getPages: AppPages.routes,
              builder: EasyLoading.init()
            )));
  }
}
