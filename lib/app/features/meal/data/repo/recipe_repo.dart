import 'package:dartz/dartz.dart';
import 'package:food_recipes/app/core/error/failure.dart';
import 'package:food_recipes/app/features/home/data/models/meal_model.dart';

abstract class MealRepo{
  Future<Either<Failure, List<MealModel>>> getMealById(int id);

}