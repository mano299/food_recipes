part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<MealModel> meals;
  const SearchSuccess({required this.meals});

  @override
  List<Object> get props => [meals];
}

final class SearchFailure extends SearchState {
  final String errMessage;

  SearchFailure({required this.errMessage});
}

final class SearchLoading extends SearchState {}
