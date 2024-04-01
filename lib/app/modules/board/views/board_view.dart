import 'package:board_uikit/app/commons/ui/responsive_layout.dart';
import 'package:board_uikit/app/modules/board/views/board_mobile_view.dart';
import 'package:board_uikit/app/modules/board/views/board_tablet_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/board_controller.dart';

class BoardView extends GetView<BoardController> {
  const BoardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ResponsiveLayout(
          mobile: BoardMobileView(),
          tablet: BoardTabletView(),
        ),
      ),
    );
  }
}
