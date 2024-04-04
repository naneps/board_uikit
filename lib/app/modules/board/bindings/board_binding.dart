import 'package:get/get.dart';

import 'package:board_uikit/app/modules/board/controllers/board_column_controller.dart';

import '../controllers/board_controller.dart';

class BoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BoardColumnController>(
      () => BoardColumnController(),
    );
    Get.lazyPut<BoardController>(
      () => BoardController(),
    );
  }
}
