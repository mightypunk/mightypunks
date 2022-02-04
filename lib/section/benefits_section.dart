import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BenefitsSection extends StatelessWidget {
  const BenefitsSection({Key? key, required this.detailText}) : super(key: key);
  final String detailText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(64.0),
      child: Column(
        children: [
          Text(
            "What benefits if you have MightyPunks?",
            style: GoogleFonts.vt323TextTheme()
                .headline2
                ?.copyWith(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
            detailText,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
