part of 'random_cubit.dart';

abstract class RandomState extends Equatable {
  const RandomState();

  @override
  List<Object?> get props => [];
}

class RandomInitial extends RandomState {}

class RandomLoading extends RandomState {}

class RandomSuccess extends RandomState {
  final MealModel meal;
  const RandomSuccess(this.meal);

  @override
  List<Object?> get props => [meal];
}

class RandomFailure extends RandomState {
  final String errMessage;
  const RandomFailure(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}
