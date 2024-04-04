class TagModel {
  final String? id;
  final String? name;
  final String? color;

  TagModel({
    this.id,
    this.name,
    this.color,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
