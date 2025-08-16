part of 'meal_cubit.dart';

sealed class MealState extends Equatable {
  const MealState();

  @override
  List<Object> get props => [];
}

final class MealInitial extends MealState {}

final class getMealSuccess extends MealState {
  final List<MealModel> meals;
  const getMealSuccess({required this.meals});

  @override
  List<Object> get props => [meals];
}

final class getMealLoading extends MealState {}

final class getMealFailure extends MealState {
  final String errMessage;
  const getMealFailure({required this.errMessage});
}
