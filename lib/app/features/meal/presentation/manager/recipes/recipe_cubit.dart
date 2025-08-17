import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipes/app/features/meal/data/models/recipe_model.dart';
import 'package:food_recipes/app/features/meal/data/repo/recipe_repo.dart';

part 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit(this.recipeModel) : super(RecipeInitial());
  final RecipeRepo recipeModel;

  Future<void> getRecipeById(String mealId) async {
  emit(getRecipeLoading());
  var result = await recipeModel.getMealById(mealId); 
  result.fold((failure) {
    emit(getRecipeFailure(errMessage: failure.errMessage));
  }, (recipe) {
    emit(getRecipeSuccess(recipe: recipe));
  });
}

}
