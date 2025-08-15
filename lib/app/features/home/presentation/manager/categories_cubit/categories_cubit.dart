import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipes/app/features/home/data/models/categories_model.dart';
import 'package:food_recipes/app/features/home/data/repo/home_repo.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());
  final HomeRepo homeRepo;
  // List<CategoriesModel> categories = [];
  Future<void> fetchCategories() async {
    emit(CategoriesLoading());
    var result = await homeRepo.fetchCategories();

    result.fold((failure) {
      emit(CategoriesFailure(failure.errMessage));
    }, (categoriesList) {
      emit(CategoriesSuccess(categoriesList));
    });
  }
}
