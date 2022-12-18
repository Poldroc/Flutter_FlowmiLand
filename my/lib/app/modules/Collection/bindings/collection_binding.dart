import 'package:get/get.dart';

import '../controllers/collection_controller.dart';

class CollectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CollectionController>(
      () => CollectionController(),
    );
  }
}
