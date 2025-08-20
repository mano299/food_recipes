part of 'meal_cubit.dart';

sealed class MealState extends Equatable {
  const MealState();

  @override
  List<Object> get props => [];
}

final class MealInitial extends MealState {}

final class MealSuccess extends MealState {
  final List<MealModel> meals;
  const MealSuccess({required this.meals});

  @override
  List<Object> get props => [meals];
}

final class MealLoading extends MealState {}

final class MealFailure extends MealState {
  final String errMessage;
  const MealFailure({required this.errMessage});
}
