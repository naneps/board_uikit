class SeverityModel {
  final String? id;
  final String? name;
  final String? color;

  SeverityModel({
    this.id,
    this.name,
    this.color,
  });

  factory SeverityModel.fromJson(Map<String, dynamic> json) {
    return SeverityModel(
      id: json['id'],
      name: json['name'],
      color: json['color'],
    );
  }
}
