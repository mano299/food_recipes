import 'package:dartz/dartz.dart';
import 'package:food_recipes/app/core/error/failure.dart';
import 'package:food_recipes/app/features/home/data/models/categories_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoriesModel>>> fetchCategories();
}
