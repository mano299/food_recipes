import 'package:dartz/dartz.dart';
import 'package:food_recipes/app/core/error/failure.dart';
import 'package:food_recipes/app/features/meal/data/models/recipe_model.dart';

abstract class RecipeRepo {
  Future<Either<Failure, List<RecipeModel>>> getMealById(String id);
}
