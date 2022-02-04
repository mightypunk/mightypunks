import 'dart:convert';

import 'package:auto_animated/auto_animated.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mightypunks/model/core_Data.dart';
import 'package:mightypunks/section/about_section.dart';
import 'package:mightypunks/section/benefits_section.dart';
import 'package:mightypunks/section/footer_section.dart';
import 'package:mightypunks/section/roadmap_section.dart';
import 'package:mightypunks/section/top_collection_section.dart';
import 'package:mightypunks/section/welcome_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<CoreData?> getCoreData() async {
      try {
        final response = await Dio().get(
            "https://raw.githubusercontent.com/mightypunk/mp/main/mightypunk.json");

        if (response.statusCode == 200) {
          debugPrint((jsonDecode(response.data)).runtimeType.toString());
          return CoreData.fromJson(jsonDecode(response.data));
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    return Scaffold(
      body: FutureBuilder<CoreData?>(
        future: getCoreData(),
        builder: (ctx, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (!snapshot.hasData) {
                return const Center(
                  child: Text("data not available"),
                );
              }
              final data = snapshot.data!;
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(1, 61, 245, 167),
                      Color.fromARGB(1, 9, 111, 224),
                    ],
                  ),
                ),
                child: LiveList(
                  // shrinkWrap: true,
                  showItemInterval: const Duration(milliseconds: 500),
                  showItemDuration: const Duration(seconds: 1),
                  addRepaintBoundaries: false,
                  scrollDirection: Axis.vertical,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index,
                      Animation<double> animation) {
                    if (index == 0) {
                      return FadeTransition(
                        opacity: Tween<double>(
                          begin: 0,
                          end: 1,
                        ).animate(animation),
                        child: ScaleTransition(
                          scale: Tween<double>(
                            begin: 0.1,
                            end: 1,
                          ).animate(animation),
                          child: _SectionItem(
                            index: index,
                            dataItem: data,
                          ),
                        ),
                      );
                    }
                    if (index == 5) {
                      return const FooterSection();
                    }
                    return FadeTransition(
                      opacity: Tween<double>(
                        begin: 0,
                        end: 1,
                      ).animate(animation),
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, -0.1),
                          end: Offset.zero,
                        ).animate(animation),
                        child: _SectionItem(
                          index: index,
                          dataItem: data,
                        ),
                      ),
                    );
                  },
                ),
              );
          }
        },
      ),
    );
  }

  // Widget _buildAnimatedItem
}

class _SectionItem extends StatelessWidget {
  const _SectionItem({Key? key, required this.index, required this.dataItem})
      : super(key: key);
  final int index;
  final CoreData dataItem;
  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return WelcomeSection(data: dataItem);
      case 1:
        return AboutSection(
          data: dataItem,
        );
      case 2:
        return BenefitsSection(
          detailText: dataItem.benefitsTitle,
        );
      case 3:
        return RoadmapSection(
          roadmaps: dataItem.roadmap,
          roadmapStatus: dataItem.roadmapStatus,
        );
      case 4:
        return TopCollectionSection(
          imgList: [...dataItem.gifs.map((e) => dataItem.gifRootEndpoint + e)],
        );

      default:
        return SizedBox(
          width: MediaQuery.of(context).size.width,
        );
    }
  }
}


/// Wrap Ui item with animation & padding
