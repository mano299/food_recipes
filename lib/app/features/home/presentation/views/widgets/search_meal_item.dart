import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/core/utils/circular_indicator.dart';
import 'package:food_recipes/app/core/utils/colors.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/home/data/models/meal_model.dart';
import 'package:food_recipes/app/features/meal/presentation/views/meal_view.dart';
import 'package:food_recipes/app/features/profile/presentation/manager/cubit/favorites_cubit.dart';

class SearchMealItem extends StatefulWidget {
  const SearchMealItem({super.key, required this.mealModel});
  final MealModel mealModel;
  @override
  State<SearchMealItem> createState() => _SearchMealItemState();
}

class _SearchMealItemState extends State<SearchMealItem> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MealView(
                mealId: widget.mealModel.mealId,
              ),
            ));
        log(widget.mealModel.mealId);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(6, 6),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: CachedNetworkImage(
                      imageUrl: widget.mealModel.mealImage ??
                          "https://folkways.today/wp-content/uploads/2022/06/iStock-1156340508.jpg",
                      placeholder: (context, url) =>
                          Center(child: CircularIndicator()),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[200],
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.grey[400],
                          size: 40,
                        ),
                      ),
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: BlocBuilder<FavoritesCubit, FavoritesState>(
                      builder: (context, state) {
                        bool isFav = false;

                        if (state is FavoritesSuccess) {
                          isFav = state.meals.any(
                              (meal) => meal.mealId == widget.mealModel.mealId);
                        }

                        return GestureDetector(
                          onTap: () {
                            if (isFav) {
                              context
                                  .read<FavoritesCubit>()
                                  .removeMealFromFavorites(
                                      widget.mealModel.mealId);
                            } else {
                              context
                                  .read<FavoritesCubit>()
                                  .addMealToFavorites(widget.mealModel);
                            }
                          },
                          child: Icon(
                            Icons.favorite,
                            size: 24,
                            color: isFav ? Colors.red : Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  widget.mealModel.mealName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      Styles.textStyle18(context).copyWith(color: kTextColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
