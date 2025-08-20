import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/features/home/data/models/categories_model.dart';
import 'package:food_recipes/app/features/home/data/models/meal_model.dart';
import 'package:food_recipes/app/features/home/data/repo/home_repo.dart';
import 'package:food_recipes/app/features/home/data/repo/home_repo_impl.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit(this.homeRepo) : super(MealInitial());

  final HomeRepo homeRepo;

  String category = "beef";

  Future<void> getMealByCategory() async {
    emit(MealLoading());
    var result = await homeRepo.getMealsByCategory(category);
    result.fold(
      (failure) => emit(MealFailure(errMessage: failure.errMessage)),
      (meals) => emit(MealSuccess(meals: meals)),
    );
  }
}

// class MealCubit extends Cubit<MealState> {
//   MealCubit(this.homeRepo) : super(MealInitial());

//   final HomeRepo homeRepo;
//   String category = "beef";
//   Future<void> getMealByCategory() async {
//     emit(getMealLoading());
//     var result = await homeRepo.getMealsByCategory(category);
//     result.fold((failure) {
//       emit(getMealFailure(errMessage: failure.errMessage));
//     }, (meals) {
//       emit(getMealSuccess(meals: meals));
//     });
//   }

//   //
//   //
//   //
//   List<MealModel> allMeals = [];
//   List<CategoriesModel> categories = [];

//   Future<void> loadAllMeals() async {
//     emit(getMealLoading());
//     List<MealModel> collected = [];
//     for (var category in categories) {
//       var result = await homeRepo.getMealsByCategory(category.category);
//       result.fold((_) {}, (meals) {  collected.addAll(meals);});
//     }
//         allMeals = collected;
//     emit(getMealSuccess(meals: allMeals));
//   }

//    // البحث في كل الوجبات
//   void searchMeals(String query) {
//     if (query.isEmpty) {
//       emit(getMealSuccess(meals: allMeals));
//     } else {
//       final filtered = allMeals
//           .where((meal) =>
//               meal.mealName.toLowerCase().contains(query.toLowerCase()))
//           .toList();

//       emit(getMealSuccess(meals: filtered));
//     }
//   }

// }
