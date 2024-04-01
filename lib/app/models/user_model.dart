class UserModel {
  String? id;
  String? username;
  String? name;
  String? email;
  String? avatar;
  UserModel({
    this.id,
    this.username,
    this.name,
    this.email,
    this.avatar,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
  }
}
