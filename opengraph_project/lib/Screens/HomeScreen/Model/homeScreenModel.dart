// To parse this JSON data, do
//
//     final cycleStats = cycleStatsFromJson(jsonString);

import 'dart:convert';

CycleStats cycleStatsFromJson(String str) =>
    CycleStats.fromJson(json.decode(str));

String cycleStatsToJson(CycleStats data) => json.encode(data.toJson());

class CycleStats {
  CycleStats({
    this.title,
    this.url,
    this.image,
    this.description,
    this.type,
    this.siteName,
  });

  String? title;
  String? url;
  Image? image;
  String? description;
  String? type;
  String? siteName;

  factory CycleStats.fromJson(Map<String, dynamic> json) => CycleStats(
        title: json["title"],
        url: json["url"],
        image: Image.fromJson(json["image"]),
        description: json["description"],
        type: json["type"],
        siteName: json["site_name"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
        "image": image!.toJson(),
        "description": description,
        "type": type,
        "site_name": siteName,
      };
}

class Image {
  Image({
    this.url,
  });

  String? url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
