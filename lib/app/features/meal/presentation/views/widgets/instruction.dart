
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Insrtuctions extends StatelessWidget {
  const Insrtuctions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Instruction:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                '1. Mix ingredients\n2. Bake for 20 mins\n3. Serve hot',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _launchYoutube,
                icon: const Icon(Icons.play_circle_fill),
                label: const Text("Watch on YouTube"),
              ),
            ],
          );
  }

    Future<void> _launchYoutube() async {
    final Uri url = Uri.parse('youtubeUrl');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
