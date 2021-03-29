// To parse this JSON data, do
//

//
//     final movieList = movieListFromJson(jsonString);

import 'dart:convert';

MovieList movieListFromJson(String str) => MovieList.fromJson(json.decode(str));

String movieListToJson(MovieList data) => json.encode(data.toJson());

class MovieList {
  MovieList({
    this.count,
    this.items,
  });

  String count;
  List<Item> items;

  factory MovieList.fromJson(Map<String, dynamic> json) => MovieList(
        count: json["COUNT"],
        items: List<Item>.from(json["ITEMS"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "COUNT": count,
        "ITEMS": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.netflixid,
    this.title,
    this.image,
    this.synopsis,
    this.rating,
    this.type,
    this.released,
    this.runtime,
    this.largeimage,
    this.unogsdate,
    this.imdbid,
    this.download,
  });

  String netflixid;
  String title;
  String image;
  String synopsis;
  String rating;
  Type type;
  String released;
  String runtime;
  String largeimage;
  DateTime unogsdate;
  String imdbid;
  String download;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        netflixid: json["netflixid"],
        title: json["title"],
        image: json["image"],
        synopsis: json["synopsis"],
        rating: json["rating"],
        type: typeValues.map[json["type"]],
        released: json["released"],
        runtime: json["runtime"],
        largeimage: json["largeimage"],
        unogsdate: DateTime.parse(json["unogsdate"]),
        imdbid: json["imdbid"],
        download: json["download"],
      );

  Map<String, dynamic> toJson() => {
        "netflixid": netflixid,
        "title": title,
        "image": image,
        "synopsis": synopsis,
        "rating": rating,
        "type": typeValues.reverse[type],
        "released": released,
        "runtime": runtime,
        "largeimage": largeimage,
        "unogsdate":
            "${unogsdate.year.toString().padLeft(4, '0')}-${unogsdate.month.toString().padLeft(2, '0')}-${unogsdate.day.toString().padLeft(2, '0')}",
        "imdbid": imdbid,
        "download": download,
      };
}

enum Type { SERIES, MOVIE }

final typeValues = EnumValues({"movie": Type.MOVIE, "series": Type.SERIES});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
