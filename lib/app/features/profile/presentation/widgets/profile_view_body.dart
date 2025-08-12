import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/home/presentation/views/widgets/popular_list_view_item.dart';
import 'package:food_recipes/app/features/profile/presentation/widgets/favorite_grid_view_item.dart';
import 'package:food_recipes/app/features/profile/presentation/widgets/favorite_header.dart';
import 'package:food_recipes/app/features/profile/presentation/widgets/user_info.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: profileAppBar(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: 26),
              UserInfo(),
              SizedBox(height: 24),
              FavoriteHeader(),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  AppBar profileAppBar(BuildContext context) {
    return AppBar(
      titleSpacing: 24,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Text(
        'Account',
        style:
            Styles.textStyle24(context).copyWith(fontWeight: FontWeight.w800),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Icon(
            FontAwesomeIcons.gear,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
