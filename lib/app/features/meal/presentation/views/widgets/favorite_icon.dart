import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({super.key});

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  Color iconColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        icon: Icon(FontAwesomeIcons.solidHeart, color: iconColor),
        onPressed: () {
          setState(() {
            iconColor = (iconColor == Colors.grey) ? Colors.red : Colors.grey;
          });
        },
      ),
    );
  }
}
