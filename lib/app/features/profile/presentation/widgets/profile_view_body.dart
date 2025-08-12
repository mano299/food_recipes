import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: profileAppBar(context),
        backgroundColor: Colors.white,
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
          style: Styles.textStyle24(context)
              .copyWith(fontWeight: FontWeight.w800),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Icon(FontAwesomeIcons.gear, color: Colors.black,),
          )
        ],
      );
  }
}
