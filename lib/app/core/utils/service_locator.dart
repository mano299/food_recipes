import 'package:dio/dio.dart';
import 'package:food_recipes/app/core/utils/api_service.dart';
import 'package:food_recipes/app/features/home/data/repo/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void Setup() {
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
}
