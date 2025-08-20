import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/styles.dart';

class searchTextField extends StatelessWidget {
  searchTextField({super.key, this.onChange});
  void Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      style: Styles.textStyle18(context),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Color(0xff969FAE), width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Color(0xff969FAE), width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide:
                BorderSide(color: Color.fromARGB(255, 36, 38, 42), width: 2)),
        prefixIcon: Icon(
          Icons.search_sharp,
          // color: Colors.black,
        ),
        hintText: "Search",
        hintStyle: Styles.textStyle18(context).copyWith(
          color: Color(0xff969FAE),
        ),
      ),
    );
  }
}
