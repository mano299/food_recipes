import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipes/app/features/home/data/models/meal_model.dart';
import 'package:food_recipes/app/features/home/data/repo/home_repo.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit(this.homeRepo) : super(MealInitial());

  final HomeRepo homeRepo;
  String category = "beef";
  Future<void> getMealByCategory() async {
    emit(getMealLoading());
    var result = await homeRepo.getMealsByCategory(category);
    result.fold((failure) {
      emit(getMealFailure(errMessage: failure.errMessage));
    }, (meals) {
      emit(getMealSuccess(meals: meals));
    });
  }
}
