class User {
<<<<<<< HEAD
  int? id;
  String? username;

  User.fromMap(Map<String, dynamic> map)
      : this.id = map["id"],
        this.username = map["username"];
=======
  int id;
  String username;

  User(this.id, this.username);
>>>>>>> 0ed494c ([feat] ë¡회원가입 구현)
}
