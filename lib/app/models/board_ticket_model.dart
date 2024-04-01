import 'package:board_uikit/app/models/user_model.dart';

class BoardTicketModel {
  String? id;
  String? title;
  String? description;
  String? columnId;
  String? boardId;
  List<UserModel>? assignees;
  String? color;
  String? createdAt;
  String? updatedAt;

  BoardTicketModel({
    this.id,
    this.title,
    this.description,
    this.columnId,
    this.boardId,
    this.color,
    this.createdAt,
    this.updatedAt,
  });

  BoardTicketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    columnId = json['columnId'];
    boardId = json['boardId'];
    color = json['color'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'columnId': columnId,
      'boardId': boardId,
      'color': color,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
