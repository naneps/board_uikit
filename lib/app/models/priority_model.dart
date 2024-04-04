class PriorityModel {
  final String? id;
  final String? name;
  final String? color;

  PriorityModel({this.id, this.name, this.color});

  factory PriorityModel.fromJson(Map<String, dynamic> json) {
    return PriorityModel(
      id: json['id'],
      name: json['name'],
      color: json['color'],
    );
  }
}
