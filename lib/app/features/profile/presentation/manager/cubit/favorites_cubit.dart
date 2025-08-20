import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipes/app/features/home/data/models/meal_model.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  Future<void> addMealToFavorites(MealModel meal) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("Favorites")
          .doc(meal.mealId)
          .set(meal.toJson());

      getFavoritesMeals();
    } catch (e) {
      emit(FavoritesFailure(errMessage: e.toString()));
    }
  }

  Future<void> getFavoritesMeals() async {
    emit(FavoritesLoading());
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("Favorites")
          .get();

      List<MealModel> favoritesMeal =
          snapshot.docs.map((doc) => MealModel.fromJson(doc.data())).toList();
      emit(FavoritesSuccess(meals: favoritesMeal));
    } catch (e) {
      emit(FavoritesFailure(errMessage: e.toString()));
    }
  }

  Future<void> removeMealFromFavorites(String mealId) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('favorites')
          .doc(mealId)
          .delete();

      getFavoritesMeals();
    } catch (e) {
      emit(FavoritesFailure(errMessage: e.toString()));
    }
  }
}
