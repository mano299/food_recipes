part of 'random_cubit.dart';

sealed class RandomState extends Equatable {
  const RandomState();

  @override
  List<Object> get props => [];
}

final class RandomInitial extends RandomState {}
final class RandomLoading extends RandomState {}
final class RandomSuccess extends RandomState {
  final MealModel meal;
  const RandomSuccess(this.meal);
}
final class RandomFailure extends RandomState {
  final String errMessage;

  const RandomFailure(this.errMessage);
  
}
