import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/profile/presentation/widgets/favorite_grid_view.dart';
import 'package:food_recipes/app/features/profile/presentation/widgets/favorite_header.dart';
import 'package:food_recipes/app/features/profile/presentation/widgets/user_info.dart';
import 'package:food_recipes/app/features/welcome/presentation/views/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: profileAppBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                SizedBox(height: 26),
                UserInfo(),
                SizedBox(height: 24),
                FavoriteHeader(),
                SizedBox(height: 12),
                MyFavoriteGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar profileAppBar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      titleSpacing: 24,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: Text(
        'Account',
        style:
            Styles.textStyle24(context).copyWith(fontWeight: FontWeight.w800),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('isLoggedIn', false);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              icon: Icon(
                FontAwesomeIcons.rightFromBracket,
                color: Colors.black,
              )),
        )
      ],
    );
  }
}
