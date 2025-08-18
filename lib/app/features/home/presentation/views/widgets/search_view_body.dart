import 'package:flutter/material.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:food_recipes/app/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: searchTextField(),
          ),
        ),
        SliverToBoxAdapter(
          child: Center(
            child: Text(
              'اعمل هنا يا قاضي <3',
              style: GoogleFonts.tajawal(fontSize: 48),
            ),
          ),
        ),
      ],
    );
  }
}
