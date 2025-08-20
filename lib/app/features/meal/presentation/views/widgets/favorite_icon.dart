import 'package:flutter/material.dart';

List<dynamic> favorites = [];

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({super.key, required this.meal});
  final dynamic meal;
  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFavorite = false;

  Color iconColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.red : Colors.grey,
        ),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;

            if (isFavorite) {
              favorites.add(widget.meal);
            } else {
              favorites.remove(widget.meal);
            }
          });
        },
      ),
    );
  }
}
