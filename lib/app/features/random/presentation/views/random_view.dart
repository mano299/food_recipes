import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/features/random/presentation/views/manager/random_cubit/random_cubit.dart';
import 'package:food_recipes/app/features/random/presentation/views/widgets/random_view_body.dart';

class RandomView extends StatelessWidget {
  const RandomView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RandomCubit()..fetchRandomMeal(),
      child: const RandomViewBody(),
    );
  }
}
