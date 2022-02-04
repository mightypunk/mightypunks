import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mightypunks/model/core_Data.dart';
import 'package:timeline_tile/timeline_tile.dart';

class RoadmapSection extends StatelessWidget {
  const RoadmapSection(
      {Key? key, required this.roadmaps, required this.roadmapStatus})
      : super(key: key);
  final List<Roadmap> roadmaps;
  final int roadmapStatus;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Roadmap",
            style: GoogleFonts.vt323TextTheme()
                .headline2
                ?.copyWith(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          ListView.builder(
            itemCount: roadmaps.length,
            itemBuilder: (context, index) {
              final roadmap = roadmaps.elementAt(index);
              final isLessThanStatus = roadmap.percentage <= roadmapStatus;
              return _RoadmapItem(
                textMessage: roadmap.points,
                percentage: roadmap.percentage,
                isLessThanStatus: isLessThanStatus,
              );
            },
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}

class _RoadmapItem extends StatelessWidget {
  const _RoadmapItem({
    Key? key,
    required this.textMessage,
    required this.percentage,
    required this.isLessThanStatus,
  }) : super(key: key);
  final List<String> textMessage;
  final int percentage;
  final bool isLessThanStatus;
  List<Widget> get messages {
    return textMessage.map((e) {
      return Text(
        "• " + e,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
      isFirst: percentage == 10,
      isLast: percentage == 99,
      indicatorStyle: IndicatorStyle(
        width: 20,
        color: isLessThanStatus
            ? const Color(0xFF27AA69)
            : const Color(0xFFDADADA),
        padding: const EdgeInsets.all(6),
      ),
      endChild: _RightChild(
        asset: isLessThanStatus ? const Icon(Icons.check) : const SizedBox(),
        title: '$percentage%',
        messages: messages,
      ),
      beforeLineStyle: LineStyle(
        color: isLessThanStatus
            ? const Color(0xFF27AA69)
            : const Color(0xFFDADADA),
      ),
    );
  }
}

class _RightChild extends StatelessWidget {
  const _RightChild({
    Key? key,
    required this.asset,
    required this.title,
    required this.messages,
    this.disabled = false,
  }) : super(key: key);

  final Widget asset;
  final String title;
  final List<Widget> messages;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                child: asset,
                opacity: disabled ? 0.5 : 1,
              ),
            ],
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: GoogleFonts.montserrat(
                  color: disabled
                      ? const Color(0xFFBABABA)
                      : const Color(0xFF636564),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: messages,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
