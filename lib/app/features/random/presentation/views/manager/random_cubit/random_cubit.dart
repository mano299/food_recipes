import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:food_recipes/app/features/home/data/models/meal_model.dart';

part 'random_state.dart';

class RandomCubit extends Cubit<RandomState> {
  RandomCubit() : super(RandomInitial());

  Future<void> fetchRandomMeal() async {
    emit(RandomLoading());
    try {
      final response = await http
          .get(Uri.parse("https://www.themealdb.com/api/json/v1/1/random.php"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final mealJson = data['meals'][0];
        final meal = MealModel.fromJson(mealJson);
        emit(RandomSuccess(meal));
      } else {
        emit(RandomFailure("Failed to load meal"));
      }
    } catch (e) {
      emit(RandomFailure(e.toString()));
    }
  }
}
