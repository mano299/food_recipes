import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:url_launcher/url_launcher_string.dart';

class YoutubeButton extends StatelessWidget {
  const YoutubeButton({super.key, required this.mealUrl});
  final String mealUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchYoutube(mealUrl);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .06,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.red,
        ),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Watch on Youtube',
                  style:
                      Styles.textStyle21(context).copyWith(color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                FontAwesomeIcons.youtube,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchYoutube(String mealUrl) async {
    if (!mealUrl.startsWith('http')) {
      mealUrl = 'https://$mealUrl';
    }
    if (!await launchUrlString(mealUrl, mode: LaunchMode.externalApplication)) {
      debugPrint("Could not launch $mealUrl");
    }
  }
}
