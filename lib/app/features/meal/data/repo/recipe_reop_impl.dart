import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_recipes/app/core/error/failure.dart';
import 'package:food_recipes/app/core/utils/api_service.dart';
import 'package:food_recipes/app/features/home/data/models/meal_model.dart';
import 'package:food_recipes/app/features/meal/data/models/recipe_model.dart';
import 'package:food_recipes/app/features/meal/data/repo/recipe_repo.dart';

class recipeRepoImpl implements recipeRepo {
  final ApiService apiService;

  recipeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<RecipeModel>>> getMealById(int id) async {
    try {
      final data = await apiService.get(endPoint: "lookup.php?i=$id");
      final recipe = (data["meals"] as List)
          .map((meal) => RecipeModel.fromJson(meal))
          .toList();
      return right(recipe);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
