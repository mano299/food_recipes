import 'package:dartz/dartz.dart';
import 'package:food_recipes/app/core/error/failure.dart';
import 'package:food_recipes/app/features/home/data/models/meal_model.dart';
import 'package:food_recipes/app/features/meal/data/models/recipe_model.dart';

abstract class recipeRepo {
  Future<Either<Failure, List<RecipeModel>>> getMealById(String id);
}
