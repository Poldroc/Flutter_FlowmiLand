import 'package:get/get.dart';

import '../controllers/newpolicy_controller.dart';

class NewpolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewpolicyController>(
      () => NewpolicyController(),
    );
  }
}
