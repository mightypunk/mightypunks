import 'package:flutter/material.dart';
import 'dart:js' as js;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...[
                _Social(
                  icon: const FaIcon(FontAwesomeIcons.discord),
                  link: "https://discord.gg/HJmZtQe6dG",
                ),
                _Social(
                  icon: const FaIcon(FontAwesomeIcons.instagram),
                  link: "https://www.instagram.com/Mightypunks",
                ),
                _Social(
                  icon: const FaIcon(FontAwesomeIcons.twitter),
                  link: "https://twitter.com/Mightypunks",
                ),
                _Social(
                  icon: Image.network(
                      "https://raw.githubusercontent.com/mightypunk/src/main/opensea.png"),
                  link: "https://opensea.io/collection/mightypunks",
                ),
              ].map(
                (e) => IconButton(
                  color: Colors.white,
                  onPressed: () {
                    js.context.callMethod('open', [e.link]);
                  },
                  icon: e.icon,
                ),
              ),
            ],
          ),
          const Text(
            '© All rights reservered MightyPunks, this project not affiliated with Larva Labs.',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _Social {
  final Widget icon;
  final String link;
  _Social({
    required this.icon,
    required this.link,
  });
}
