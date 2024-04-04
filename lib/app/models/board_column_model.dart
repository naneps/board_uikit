import 'package:board_uikit/app/commons/helper/date_formatter.dart';
import 'package:board_uikit/app/models/board_ticket_model.dart';
import 'package:get/get.dart';

class BoardColumnModel {
  String? id;
  String? title;
  String? description;
  String? color;
  String? boardId;
  int? boardIndex;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  final RxBool _isExpanded = false.obs;
  RxList<BoardTicketModel>? tickets = <BoardTicketModel>[].obs;
  BoardColumnModel({
    this.id,
    this.title,
    this.color,
    this.boardIndex,
    this.tickets,
    this.description,
    this.boardId,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
  });
  BoardColumnModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];
    boardId = json['boardId'];
    boardIndex = json['boardIndex'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    if (json['tickets'] != null) {
      tickets = <BoardTicketModel>[].obs;
      json['tickets'].forEach((v) {
        tickets!.add(BoardTicketModel.fromJson(v));
      });
    }
  }
  int get colorHex => int.parse('0x$color');
  String get createdAtFormatted => DateFormatter.formatDDMonthYYYY(createdAt!);
  RxBool get isExpanded => _isExpanded;

  // copy with
  BoardColumnModel copyWith({
    String? id,
    String? title,
    String? color,
    String? boardId,
    int? boardIndex,
    String? createdAt,
    String? updatedAt,
    String? description,
    String? createdBy,
    RxList<BoardTicketModel>? tickets,
  }) {
    return BoardColumnModel(
      id: id ?? this.id,
      title: title ?? this.title,
      color: color ?? this.color,
      boardId: boardId ?? this.boardId,
      description: description ?? this.description,
      boardIndex: boardIndex ?? this.boardIndex,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdBy: createdBy ?? this.createdBy,
      tickets: tickets ?? this.tickets,
    );
  }

  void toggleExpansion() {
    _isExpanded.value = !_isExpanded.value;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['color'] = color;
    data['boardId'] = boardId;
    data['boardIndex'] = boardIndex;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['description'] = description;
    data['createdBy'] = createdBy;
    if (tickets != null) {
      data['tickets'] = tickets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
