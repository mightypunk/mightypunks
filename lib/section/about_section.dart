import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mightypunks/model/core_Data.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key, required this.data}) : super(key: key);
  final CoreData data;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return MediaQuery.of(context).size.width < 640
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          data.aboutTitle,
                          style: GoogleFonts.vt323TextTheme()
                              .headline2
                              ?.copyWith(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          data.aboutText,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: SizedBox(
                      width: 250,
                      height: 360,
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 9,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            // childAspectRatio: 1,
                            crossAxisCount: 3,
                            mainAxisExtent: 80,
                          ),
                          itemBuilder: (ctx, index) {
                            final gifs = data.gifs.take(9);
                            return Image.network(
                              data.gifRootEndpoint + gifs.elementAt(index),
                              width: 80,
                              height: 80,
                            );
                          }),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              height: 360,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(64.0),
                      child: Column(
                        children: [
                          Text(
                            data.aboutTitle,
                            style: GoogleFonts.vt323TextTheme()
                                .headline2
                                ?.copyWith(
                                    fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data.aboutText,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: SizedBox(
                      width: 250,
                      height: 360,
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 9,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            // childAspectRatio: 1,
                            crossAxisCount: 3,
                            mainAxisExtent: 80,
                          ),
                          itemBuilder: (ctx, index) {
                            final gifs = data.gifs.take(9);
                            return Image.network(
                              data.gifRootEndpoint + gifs.elementAt(index),
                              width: 80,
                              height: 80,
                            );
                          }),
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
