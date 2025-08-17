part of 'recipe_cubit.dart';

sealed class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object> get props => [];
}

final class RecipeInitial extends RecipeState {}

final class getRecipeSuccess extends RecipeState {
  final List<RecipeModel> recipe;
  const getRecipeSuccess({required this.recipe});

  @override
  List<Object> get props => [recipe];
}

final class getRecipeLoading extends RecipeState {}

final class getRecipeFailure extends RecipeState {
  final String errMessage;

  const getRecipeFailure({required this.errMessage});
}
