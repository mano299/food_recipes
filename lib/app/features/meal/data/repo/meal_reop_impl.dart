import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_recipes/app/core/error/failure.dart';
import 'package:food_recipes/app/core/utils/api_service.dart';
import 'package:food_recipes/app/features/home/data/models/meal_model.dart';
import 'package:food_recipes/app/features/meal/data/repo/meal_repo.dart';

class MealRepoImpl implements MealRepo {
  final ApiService apiService;

  MealRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<MealModel>>> getMealById(int id) async {
    try {
      final data = await apiService.get(endPoint: "lookup.php?i=$id");
      final meals = (data["meals"] as List)
          .map((meal) => MealModel.fromJson(meal))
          .toList();
      return right(meals);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
