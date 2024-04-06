import 'package:board_uikit/app/commons/helper/generator.dart';
import 'package:board_uikit/app/models/board_column_model.dart';
import 'package:board_uikit/app/models/board_ticket_model.dart';
import 'package:board_uikit/app/modules/board/controllers/board_column_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BoardController extends GetxController {
  static const String columnsKey = 'columns';
  final RxList<BoardColumnModel> columns = <BoardColumnModel>[].obs;
  final Rx<BoardColumnModel> newColumn = BoardColumnModel(
    id: Generator.generateUniqueId(),
    title: 'New Column',
    description: '',
    boardIndex: 0,
    color: 'FFC3C3C3',
    tickets: <BoardTicketModel>[].obs,
  ).obs;
  final GetStorage storage = GetStorage();

  void addColumnToStorage() {
    columns.add(
      newColumn.value.copyWith(
        boardIndex: columns.length,
        id: Generator.generateUniqueId(),
        tickets: <BoardTicketModel>[].obs,
        createdAt: DateTime.now().toIso8601String(),
      ),
    );
    updateColumnsInStorage();
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
        number: generateLastNumberTicket().toString(),
        createdAt: DateTime.now().toIso8601String(),
      ),
    );
    updateColumnsInStorage();
  }

  int generateLastNumberTicket() {
    int countAllTickets = 0;
    for (var column in columns) {
      countAllTickets += column.tickets!.length;
    }
    return countAllTickets + 1;
  }

  void onDragAccept(BoardTicketModel? data, BoardColumnModel column) {
    if (data != null) {
      final BoardColumnModel oldColumn = columns.firstWhere(
        (element) => element.id == data.columnId,
      );
      oldColumn.tickets!.remove(data);
      column.tickets!.add(data.copyWith(
        columnId: column.id,
        boardId: column.boardId,
      ));
      updateColumnsInStorage();
    }
  }

  void onDragWillAccept(BoardTicketModel? data, BoardColumnModel column) {}

  @override
  void onInit() {
    super.onInit();
    _initializeColumns();
  }

  /// Removes a column from the board.
  ///
  /// The [columnId] parameter specifies the ID of the column to be removed.
  /// This method removes the column with the specified ID from the [columns] list
  /// and updates the columns in the storage.
  void removeColumn(String columnId) {
    columns.removeWhere((element) => element.id == columnId);
    updateColumnsInStorage();
  }

  /// Reorders the columns in the board.
  ///
  /// This method takes the old index and new index of a column and reorders the columns accordingly.
  /// If the old index is less than the new index, the new index is decremented by 1 to account for the removal of the column.
  /// The column at the old index is removed from the list of columns and inserted at the new index.
  /// Finally, the updated columns are saved to storage.
  void reorderColumns(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final BoardColumnModel column = columns.removeAt(oldIndex);

    columns.insert(newIndex, column);
    updateColumnsInStorage();
  }

  void reorderTickets(
    String columnId,
    int oldIndex,
    int newIndex,
  ) {
    final BoardColumnModel column = columns.firstWhere(
      (element) => element.id == columnId,
    );
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final BoardTicketModel ticket = column.tickets!.removeAt(oldIndex);
    column.tickets!.insert(newIndex, ticket);
    updateColumnsInStorage();
  }

  void toggleAllExpansionTiles() {
    for (final column in columns) {
      Get.find<BoardColumnController>(tag: column.id)
          .expansionTileController
          .collapse();
    }
  }

  /// Updates the columns in the storage.
  ///
  /// This method writes the updated columns to the storage by converting them to JSON format.
  /// It uses the `columnsKey` to identify the storage key for the columns.
  /// The columns are converted to a list of JSON objects using the `toJson` method.
  /// Finally, the list of JSON objects is written to the storage using the `write` method.
  void updateColumnsInStorage() {
    storage.write(
      columnsKey,
      columns.map((e) => e.toJson()).toList(),
    );
  }

  void _addFirstColumn() {
    storage.writeIfNull(
      columnsKey,
      [
        BoardColumnModel(
          id: Generator.generateUniqueId(),
          title: 'To Do',
          color: 'FFC3C3C3',
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
}
