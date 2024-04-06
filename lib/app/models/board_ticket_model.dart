import 'package:board_uikit/app/models/priority_model.dart';
import 'package:board_uikit/app/models/severity_model.dart';
import 'package:board_uikit/app/models/tag_model.dart';
import 'package:board_uikit/app/models/user_model.dart';
import 'package:get/get.dart';

class BoardTicketModel {
  String? id;
  String? title;
  String? description;
  String? columnId;
  String? code;
  String? number;
  String? boardId;
  RxList<UserModel>? assignees;
  RxList<TagModel>? tags;
  Rx<SeverityModel>? severity;
  Rx<PriorityModel>? priority;
  String? startDate;
  String? endDate;

  String? color;
  String? createdAt;
  String? updatedAt;

  BoardTicketModel({
    this.id,
    this.title,
    this.description,
    this.columnId,
    this.code,
    this.number,
    this.boardId,
    this.assignees,
    this.color,
    this.tags,
    this.severity,
    this.priority,
    this.startDate,
    this.endDate,
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

  BoardTicketModel copyWith({
    String? id,
    String? title,
    String? description,
    String? columnId,
    String? code,
    String? number,
    String? boardId,
    RxList<UserModel>? assignees,
    String? color,
    String? createdAt,
    String? updatedAt,
  }) {
    return BoardTicketModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      columnId: columnId ?? this.columnId,
      code: code ?? this.code,
      number: number ?? this.number,
      boardId: boardId ?? this.boardId,
      assignees: assignees ?? this.assignees,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
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
