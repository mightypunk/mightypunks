import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HowToBuySection extends StatelessWidget {
  const HowToBuySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "How To Buy",
            style: GoogleFonts.vt323TextTheme()
                .headline2
                ?.copyWith(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: const _BuyStepsView()),
        ],
      ),
    );
  }
}

class _BuyStepsView extends StatefulWidget {
  const _BuyStepsView({Key? key}) : super(key: key);

  @override
  State<_BuyStepsView> createState() => _BuyStepsViewState();
}

class _BuyStepsViewState extends State<_BuyStepsView> {
  late final PageController _pCOntroller;
  int _current = 0;
  @override
  void initState() {
    _pCOntroller = PageController();

    super.initState();
  }

  final _steps = <_Step>[
    _Step(
        imageUrl:
            "https://raw.githubusercontent.com/mightypunk/src/main/Screen%20Shot%202022-02-03%20at%2009.54.14.png",
        name: "open mighty punks on opensea",
        url: "https://opensea.io/collection/mightypunks"),
    _Step(
      imageUrl:
          "https://raw.githubusercontent.com/mightypunk/src/main/Screen%20Shot%202022-02-03%20at%2009.54.14.png",
      name: "open mighty punks on opensea",
    ),
    _Step(
      imageUrl:
          "https://raw.githubusercontent.com/mightypunk/src/main/Screen%20Shot%202022-02-03%20at%2009.54.14.png",
      name: "open mighty punks on opensea",
    ),
    _Step(
      imageUrl:
          "https://raw.githubusercontent.com/mightypunk/src/main/Screen%20Shot%202022-02-03%20at%2009.54.14.png",
      name: "open mighty punks on opensea",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
              pageSnapping: false,
              controller: _pCOntroller,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (i) {
                setState(() {
                  _current = i;
                });
              },
              itemBuilder: (context, index) {
                if (index >= _steps.length) {
                  return const SizedBox(
                    width: 10,
                    height: 10,
                  );
                }
                final step = _steps.elementAt(index);

                return Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedScale(
                        scale: _current == index ? 1 : 0.5,
                        child: Card(
                          child: SizedBox(
                            width: 250,
                            height: 300,
                            child: Column(
                              children: [
                                Image.network(
                                  step.imageUrl,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(step.name),
                                      step.url == null
                                          ? const SizedBox()
                                          : MaterialButton(
                                              onPressed: () {
                                                js.context.callMethod(
                                                    'open', [step.url]);
                                              },
                                              child: const Text("open"),
                                            )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        duration: const Duration(milliseconds: 350),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: AnimatedOpacity(
              opacity: _current != 0 ? 1 : 0,
              duration: const Duration(milliseconds: 250),
              child: IconButton(
                iconSize: 32,
                onPressed: _current == 0
                    ? null
                    : () {
                        _pCOntroller.animateToPage(
                          _current - 1,
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeIn,
                        );
                      },
                icon: const Icon(
                  Icons.chevron_left_outlined,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: AnimatedOpacity(
              opacity: _current != (_steps.length - 1) ? 1 : 0,
              duration: const Duration(milliseconds: 250),
              child: IconButton(
                iconSize: 32,
                onPressed: _current == (_steps.length - 1)
                    ? null
                    : () {
                        _pCOntroller.animateToPage(
                          _current + 1,
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeIn,
                        );
                      },
                icon: const Icon(
                  Icons.chevron_right_outlined,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Step {
  final String imageUrl;
  final String name;
  final String? url;
  _Step({
    this.url,
    required this.imageUrl,
    required this.name,
  });
}
