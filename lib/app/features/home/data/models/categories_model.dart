class CategoriesModel {
  final String category;

  CategoriesModel({required this.category});

  factory CategoriesModel.fromJson(Map<String, dynamic> data) {
    return CategoriesModel(category: data["strCategory"]);
  }
}
