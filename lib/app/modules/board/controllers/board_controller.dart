import 'package:board_uikit/app/commons/helper/generator.dart';
import 'package:board_uikit/app/models/board_column_model.dart';
import 'package:board_uikit/app/models/board_ticket_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BoardController extends GetxController {
  static const String columnsKey = 'columns';
  final RxList<BoardColumnModel> columns = <BoardColumnModel>[].obs;
  final Rx<BoardColumnModel> newColumn = BoardColumnModel(
    id: Generator.generateUniqueId(),
    title: 'New Column',
    description: '',
    color: Generator.generateRandomColor(),
    boardIndex: 0,
    tickets: <BoardTicketModel>[].obs,
  ).obs;
  final GetStorage storage = GetStorage();

  void addColumnToStorage() {
    columns.add(
      newColumn.value.copyWith(
        boardIndex: columns.length,
        id: Generator.generateUniqueId(),
        color: Generator.generateRandomColor(
          maxLightness: 200,
          minDarkness: 100,
        ),
        tickets: <BoardTicketModel>[].obs,
        createdAt: DateTime.now().toIso8601String(),
      ),
    );
    _updateColumnsInStorage();
  }

  void addTicket(String columnId) {
    final BoardColumnModel column = columns.firstWhere(
      (element) => element.id == columnId,
    );
    column.tickets!.add(
      BoardTicketModel(
        id: Generator.generateUniqueId(),
        title: 'New Ticket',
        columnId: columnId,
        boardId: column.boardId,
        color: Generator.generateRandomColor(),
        createdAt: DateTime.now().toIso8601String(),
      ),
    );
    _updateColumnsInStorage();
  }

  @override
  void onInit() {
    super.onInit();
    _initializeColumns();
  }

  void removeColumn(int columnIndex) {
    if (columnIndex >= 0 && columnIndex < columns.length) {
      columns.removeAt(columnIndex);
      _updateColumnsInStorage();
    } else {
      debugPrint('Invalid column index: $columnIndex');
    }
  }

  void reorderColumns(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final BoardColumnModel column = columns.removeAt(oldIndex);
    columns.insert(newIndex, column);
    _updateColumnsInStorage();
  }

  void _addFirstColumn() {
    storage.writeIfNull(
      columnsKey,
      [
        BoardColumnModel(
          id: Generator.generateUniqueId(),
          title: 'To Do',
          color: '0xFFC3C3C3',
          boardIndex: 0,
          createdAt: DateTime.now().toIso8601String(),
          tickets: <BoardTicketModel>[].obs,
        ).toJson()
      ],
    );
    _initializeColumns(); // Refresh columns after adding the first column
  }

  void _initializeColumns() {
    final List<dynamic>? columnsList = storage.read(columnsKey);
    if (columnsList != null) {
      columns.assignAll(
        columnsList.map((e) => BoardColumnModel.fromJson(e)).toList(),
      );
    } else {
      _addFirstColumn();
    }
  }

  void _updateColumnsInStorage() {
    storage.write(
      columnsKey,
      columns.map((e) => e.toJson()).toList(),
    );
  }
}
