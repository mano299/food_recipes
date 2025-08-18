import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/app/core/utils/colors.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/welcome/data/model/user_data_model.dart';
import 'package:food_recipes/app/features/welcome/presentation/manager/user_data_cubit/user_data_cubit.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    UserDataModel userDataModel =
        BlocProvider.of<UserDataCubit>(context).userDataModel;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              maxRadius: 36,
              backgroundColor: Colors.transparent,
              child: Image.asset('assets/photos/james.png'),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    userDataModel == null
                        ? "Magdy Afsha"
                        : userDataModel.fullName,
                    style: Styles.textStyle24(context)
                        .copyWith(fontWeight: FontWeight.w900)),
                Text('High Recommended Chef',
                    style: Styles.textStyle14(context)
                        .copyWith(color: Colors.grey.shade700)),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.verified,
                color: kTextColor,
                size: 28,
              ),
            )
          ],
        ),
      ),
    );
  }
}
