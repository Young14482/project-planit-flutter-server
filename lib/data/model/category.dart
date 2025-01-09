class Category {
  int id;
  String name;

  Category.fromMap(Map<String, dynamic> map)
      : this.id = map["id"],
        this.name = map["name"];
}
