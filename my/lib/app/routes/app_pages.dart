import 'package:get/get.dart';

import '../modules/Collection/bindings/collection_binding.dart';
import '../modules/Collection/views/collection_view.dart';
import '../modules/Communication/bindings/communication_binding.dart';
import '../modules/Communication/views/communication_view.dart';
import '../widget/common_landDetail.dart.dart';

import '../modules/User/bindings/user_binding.dart';
import '../modules/User/views/user_view.dart';
import '../modules/add/bindings/add_binding.dart';
import '../modules/add/views/add_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/newpolicy/bindings/newpolicy_binding.dart';
import '../modules/newpolicy/views/newpolicy_view.dart';
import '../modules/signup/signUp.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.COLLECTION,
      page: () => const CollectionView(),
      binding: CollectionBinding(),
    ),
    GetPage(
      name: _Paths.COMMUNICATION,
      page: () => const CommunicationView(),
      binding: CommunicationBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => const UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ADD,
      page: () => const AddView(),
      binding: AddBinding(),
    ),
    
    GetPage(
      name: _Paths.NEWPOLICY,
      page: () => const NewpolicyView(),
      binding: NewpolicyBinding(),
    ),
  ];
}
