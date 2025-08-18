import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_recipes/app/core/utils/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeButton extends StatelessWidget {
  const YoutubeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchYoutube,
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

  Future<void> _launchYoutube() async {
    final Uri url = Uri.parse('www');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
