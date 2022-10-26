import 'package:get/get.dart';

import '../controllers/cartscreen_controller.dart';

class CartscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartscreenController>(
      () => CartscreenController(),
    );
  }
}
