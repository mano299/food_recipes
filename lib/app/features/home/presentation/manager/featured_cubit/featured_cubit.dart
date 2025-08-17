import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipes/app/core/error/failure.dart';

import 'package:food_recipes/app/features/home/data/models/meal_model.dart';
import 'package:food_recipes/app/features/home/data/repo/home_repo.dart';

part 'featured_state.dart';

class FeaturedCubit extends Cubit<FeaturedState> {
  final HomeRepo featuredRepo;

  FeaturedCubit(this.featuredRepo) : super(FeaturedInitial());

  Future<void> getFeaturedData() async {
    emit(FeaturedLoading());

    final Either<Failure, List<MealModel>> result =
        await featuredRepo.fetchFeatured();

    result.fold(
      (failure) => emit(FeaturedFailured(failure.errMessage)),
      (meals) => emit(FeaturedSuccess(meals)),
    );
  }
}
