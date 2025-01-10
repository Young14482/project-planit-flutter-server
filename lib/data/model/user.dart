class User {
  int? id;
  String? username;

  User.fromMap(Map<String, dynamic> map)
      : this.id = map["id"],
        this.username = map["username"];
}
