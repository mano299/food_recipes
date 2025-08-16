class MealModel {
  final String mealName;
  final String? mealImage;
  final String mealId;

  MealModel(
      {required this.mealName, required this.mealImage, required this.mealId});

  factory MealModel.fromJson(Map<String, dynamic> meals) {
    return MealModel(
      mealName: meals["strMeal"],
      mealImage: meals["strMealThumb"],
      mealId: meals["idMeal"],
    );
  }
}
