class RecipeModel {
  final String idMeal;
  final String strMeal;
  final String? strMealAlternate;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final String? strTags;
  final String? strYoutube;
  final List<String> ingredients;
  final List<String> measures;

  RecipeModel({
    required this.idMeal,
    required this.strMeal,
    this.strMealAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    this.strTags,
    this.strYoutube,
    required this.ingredients,
    required this.measures,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    List<String> measures = [];

    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];

      if (ingredient != null &&
          ingredient.toString().isNotEmpty &&
          ingredient.toString().trim().isNotEmpty) {
        ingredients.add(ingredient);
        measures.add(measure ?? '');
      }
    }

    return RecipeModel(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strMealAlternate: json['strMealAlternate'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
      strTags: json['strTags'],
      strYoutube: json['strYoutube'],
      ingredients: ingredients,
      measures: measures,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "idMeal": idMeal,
      "strMeal": strMeal,
      "strMealAlternate": strMealAlternate,
      "strCategory": strCategory,
      "strArea": strArea,
      "strInstructions": strInstructions,
      "strMealThumb": strMealThumb,
      "strTags": strTags,
      "strYoutube": strYoutube,
    };

    for (int i = 0; i < ingredients.length; i++) {
      data["strIngredient${i + 1}"] = ingredients[i];
      data["strMeasure${i + 1}"] = measures[i];
    }

    return data;
  }
}
