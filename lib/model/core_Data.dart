// To parse this JSON data, do
//
//     final coreData = coreDataFromJson(jsonString);

import 'dart:convert';

CoreData coreDataFromJson(String str) => CoreData.fromJson(json.decode(str));

String coreDataToJson(CoreData data) => json.encode(data.toJson());

class CoreData {
  const CoreData({
    required this.gifs,
    required this.gifRootEndpoint,
    required this.banner,
    required this.bannerOutline,
    required this.logo,
    required this.welcomeText,
    required this.aboutTitle,
    required this.aboutText,
    required this.benefitsTitle,
    required this.roadmap,
    required this.roadmapStatus,
  });

  final List<String> gifs;
  final String gifRootEndpoint;
  final String banner;
  final String bannerOutline;
  final String logo;
  final String welcomeText;
  final String aboutTitle;
  final String aboutText;
  final String benefitsTitle;
  final List<Roadmap> roadmap;
  final int roadmapStatus;

  factory CoreData.fromJson(Map<String, dynamic> json) => CoreData(
        gifs: List<String>.from(json["gifs"].map((x) => x)),
        gifRootEndpoint: json["gif_root_endpoint"],
        banner: json["banner"],
        bannerOutline: json["banner_outline"],
        logo: json["logo"],
        welcomeText: json["welcome_text"],
        aboutTitle: json["about_title"],
        aboutText: json["about_text"],
        benefitsTitle: json["benefits_title"],
        roadmap:
            List<Roadmap>.from(json["roadmap"].map((x) => Roadmap.fromJson(x))),
        roadmapStatus: json["roadmap_status"],
      );

  Map<String, dynamic> toJson() => {
        "gifs": List<dynamic>.from(gifs.map((x) => x)),
        "gif_root_endpoint": gifRootEndpoint,
        "banner": banner,
        "banner_outline": bannerOutline,
        "logo": logo,
        "welcome_text": welcomeText,
        "about_title": aboutTitle,
        "about_text": aboutText,
        "benefits_title": benefitsTitle,
        "roadmap": List<dynamic>.from(roadmap.map((x) => x.toJson())),
        "roadmap_status": roadmapStatus,
      };
}

class Roadmap {
  const Roadmap({
    required this.percentage,
    required this.points,
  });

  final int percentage;
  final List<String> points;

  factory Roadmap.fromJson(Map<String, dynamic> json) => Roadmap(
        percentage: json["percentage"],
        points: List<String>.from(json["points"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "percentage": percentage,
        "points": List<dynamic>.from(points.map((x) => x)),
      };
}
