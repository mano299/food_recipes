import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipes/app/features/home/data/models/meal_model.dart';

part 'random_state.dart';

class RandomCubit extends Cubit<RandomState> {
  RandomCubit() : super(RandomInitial());

  final Dio dio = Dio();

  Future<void> fetchRandomMeal() async {
    emit(RandomLoading());
    try {
      final response =
          await dio.get("https://www.themealdb.com/api/json/v1/1/random.php");

      if (response.statusCode == 200) {
        final data = response.data;
        final meals = data["meals"] as List;
        final meal = MealModel.fromJson(meals.first);

        emit(RandomSuccess(meal));
      } else {
        emit(RandomFailure("Failed with status: ${response.statusCode}"));
      }
    } catch (e) {
      emit(RandomFailure(e.toString()));
    }
  }
}
