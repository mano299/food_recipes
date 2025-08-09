import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class searchTextField extends StatelessWidget {
  const searchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Styles.textStyle18(context),
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xff969FAE), width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xff969FAE), width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 36, 38, 42), width: 2)),
          prefixIcon: Icon(
            Icons.search_sharp,
            // color: Colors.black,
          ),
          hint: Text(
            "Search",
            style:
                Styles.textStyle18(context).copyWith(color: Color(0xff969FAE)),
          )),
    );
  }
}
