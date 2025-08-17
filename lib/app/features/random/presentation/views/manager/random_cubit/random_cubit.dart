import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipes/app/features/home/data/models/meal_model.dart';

part 'random_state.dart';

class RandomCubit extends Cubit<RandomState> {
  RandomCubit() : super(RandomInitial());
}
