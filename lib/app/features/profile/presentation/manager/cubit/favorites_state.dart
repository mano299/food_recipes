part of 'favorites_cubit.dart';

sealed class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesSuccess extends FavoritesState {
  final List<MealModel> meals;
  const FavoritesSuccess({required this.meals});

  @override
  List<Object> get props => [meals];
}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesFailure extends FavoritesState {
  final String errMessage;

  FavoritesFailure({required this.errMessage});
}
