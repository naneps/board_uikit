import 'package:get/get.dart';

import '../modules/board/bindings/board_binding.dart';
import '../modules/board/views/board_view.dart';
import '../modules/core/bindings/core_binding.dart';
import '../modules/core/views/core_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.BOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CORE,
      page: () => const CoreView(),
      binding: CoreBinding(),
    ),
    GetPage(
      name: _Paths.BOARD,
      page: () => const BoardView(),
      binding: BoardBinding(),
    ),
  ];

  AppPages._();
}
