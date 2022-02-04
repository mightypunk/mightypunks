import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:js' as js;
import 'package:mightypunks/widgets/carousel_with_indicator.dart';

class TopCollectionSection extends StatelessWidget {
  const TopCollectionSection({Key? key, required this.imgList})
      : super(key: key);
  final List<String> imgList;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Collection",
                style: GoogleFonts.vt323TextTheme()
                    .headline2
                    ?.copyWith(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              MaterialButton(
                onPressed: () {
                  js.context.callMethod(
                      'open', ["https://opensea.io/collection/mightypunks"]);
                },
                child: Row(
                  children: const [
                    Text("See all at Opensea"),
                    Icon(Icons.chevron_right_outlined),
                  ],
                ),
              )
            ],
          ),
          CarouselWithIndicator(imgList: imgList),
        ],
      ),
    );
  }
}
