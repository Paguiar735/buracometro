import 'package:buracometro/modules/core/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'Quem Somos?',
            style: AppStyles.bigTitleTextStyle,
          ),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: AppStyles.normalTextStyle,
          ),
          TextButton(
            child: Text("Nosso LinkTree"),
            onPressed: () async {
              final Uri url = Uri.parse('https://www.gambiarrasdoamom.com/');
              if (await canLaunchUrl(url)){
                await launchUrl(url);
              }
            },
            style: TextButton.styleFrom(
              backgroundColor: AppThemes.highLightColor,
              primary: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
