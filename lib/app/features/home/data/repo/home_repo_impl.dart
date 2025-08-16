import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_recipes/app/core/error/failure.dart';
import 'package:food_recipes/app/core/utils/api_service.dart';
import 'package:food_recipes/app/features/home/data/models/categories_model.dart';
import 'package:food_recipes/app/features/home/data/models/meal_model.dart';
import 'package:food_recipes/app/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<CategoriesModel>>> fetchCategories() async {
    try {
      dynamic data = await apiService.get(endPoint: "list.php?c=list");
      List<CategoriesModel> categories = [];
      for (var item in data["meals"]) {
        categories.add(CategoriesModel.fromJson(item));
      }

      return right(categories);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  //String category;
  @override
  Future<Either<Failure, List<MealModel>>> getMealsByCategory() async {
    try {
      Map<String, dynamic> data =
          await apiService.get(endPoint: "filter.php?c=Seafood");
      List<MealModel> meals = [];
      for (var meal in data["meals"]) {
        meals.add(MealModel.fromJson(meal));
      }
      return right(meals);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
