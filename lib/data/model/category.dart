class Category {
  int id;
  String name;

  Category({required this.id, required this.name});


  @override
  String toString() {
    return 'Category{id: $id, name: $name}';
  }

  Category.fromMap(Map<String, dynamic> map)
      : this.id = map["id"],
        this.name = map["name"];
}
