import 'package:board_uikit/app/models/board_column_model.dart';
import 'package:board_uikit/app/models/board_ticket_model.dart';
import 'package:board_uikit/app/modules/board/controllers/board_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardColumnController extends GetxController {
  //TODO: Implement BoardColumnController
  BoardColumnModel? column = BoardColumnModel();
  final ExpansionTileController expansionTileController =
      ExpansionTileController();
  final boardController = Get.find<BoardController>();
  RxnBool canDrag = RxnBool(false);
  BoardColumnController({
    this.column,
  });
  void reorderTickets(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final BoardColumnModel column = boardController.columns.firstWhere(
      (element) => element.id == this.column!.id,
    );
    print("currentColumn: ${column.id}");
    print('reorderTickets: ${column.tickets!.length}');
    final BoardTicketModel ticket = column.tickets!.removeAt(oldIndex);
    column.tickets!.insert(newIndex, ticket);
    boardController.updateColumnsInStorage();
  }
}
