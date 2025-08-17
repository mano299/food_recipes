part of 'featured_cubit.dart';


sealed class FeaturedState extends Equatable {
  const FeaturedState();

  @override
  List<Object> get props => [];
}

final class FeaturedInitial extends FeaturedState {}

final class FeaturedLoading extends FeaturedState {}

final class FeaturedSuccess extends FeaturedState {
  final List<MealModel> meals;

  const FeaturedSuccess(this.meals);

  @override
  List<Object> get props => [meals];
}

final class FeaturedFailured extends FeaturedState {
  final String errMeassage;

  const FeaturedFailured(this.errMeassage);

  @override
  List<Object> get props => [errMeassage];
}
