import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mightypunks/model/core_Data.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({Key? key, required this.data}) : super(key: key);
  final CoreData data;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 16 / 6,
            child: Stack(
              children: [
                Image.network(data.banner),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: LayoutBuilder(
                    builder: (context, child) => CircleAvatar(
                      radius:
                          MediaQuery.of(context).size.width < 640 ? 60 : 100,
                      backgroundImage: NetworkImage(data.logo),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data.welcomeText,
              style: GoogleFonts.vt323TextTheme().headline2?.copyWith(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
    );
  }
}
