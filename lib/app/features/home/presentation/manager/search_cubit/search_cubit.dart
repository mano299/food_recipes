import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipes/app/features/home/data/models/categories_model.dart';
import 'package:food_recipes/app/features/home/data/models/meal_model.dart';
import 'package:food_recipes/app/features/home/data/repo/home_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());

  final HomeRepo homeRepo;
  List<MealModel> allMeals = [];
  List<CategoriesModel> categories = [];

  Future<void> loadAllMeals() async {
    emit(SearchLoading());

    try {
      final results = await Future.wait(
        categories.map((c) => homeRepo.getMealsByCategory(c.category)),
      );

      List<MealModel> collected = [];

      for (var result in results) {
        result.fold(
          (_) {},
          (meals) => collected.addAll(meals),
        );
      }

      allMeals = collected;
      emit(SearchSuccess(meals: allMeals));
    } catch (e) {
      emit(SearchFailure(errMessage: e.toString()));
    }
  }

  void searchMeals(String query) {
    if (allMeals.isEmpty) {
      emit(SearchInitial()); // أو تخليها SearchInitial
      return;
    }
    if (query.isEmpty) {
      emit(SearchInitial());
    } else {
      final filtered = allMeals
          .where((meal) =>
              meal.mealName.toLowerCase().contains(query.toLowerCase()))
          .toList();

      emit(SearchSuccess(meals: filtered));
    }
  }
}
