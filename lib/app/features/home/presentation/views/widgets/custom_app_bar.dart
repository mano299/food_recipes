import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/core/utils/circular_indicator.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/welcome/presentation/manager/user_data_cubit/user_data_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  DateTime.now().hour < 12
                      ? Icons.wb_sunny_outlined
                      : Icons.nightlight_round_outlined,
                  color: Color(0xff4D8194),
                  size: 26,
                ),
                SizedBox(width: 4),
                Text(
                  DateTime.now().hour < 12 ? 'Good Morning' : 'Good Evening',
                  style: Styles.textStyle16(context).copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
              ],
            ),
            BlocBuilder<UserDataCubit, UserDataState>(
              builder: (context, state) {
                if (state is UserDataSuccess) {
                  return Text(
                    state.userDataModel.fullName,
                    style: Styles.textStyle28(context),
                  );
                } else if (state is UserDataFailure) {
                  return Center(
                    child: Text(
                      state.errMessage,
                      style: Styles.textStyle21(context),
                    ),
                  );
                } else {
                  return Center(child: CircularIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
