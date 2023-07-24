import 'dart:convert';

NoticiasModel cineForoModelFromJson(String str) =>
    NoticiasModel.fromJson(json.decode(str));

String cineForoModelToJson(NoticiasModel data) => json.encode(data.toJson());

class NoticiasModel {
  String id;
  String title;
  List<RelatedModel> related;
  String description;
  ImageModel image;

  NoticiasModel({
    required this.id,
    required this.title,
    required this.related,
    required this.description,
    required this.image,
  });

  factory NoticiasModel.fromJson(Map<String, dynamic> json) => NoticiasModel(
        id: json["id"],
        title: json["title"],
        related: List<RelatedModel>.from(
            json["related"].map((x) => RelatedModel.fromJson(x))),
        description: json["description"],
        image: ImageModel.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "related": List<dynamic>.from(related.map((x) => x.toJson())),
        "description": description,
        "image": image.toJson()
      };
}

class RelatedModel {
  String type;
  String name;

  RelatedModel({
    required this.type,
    required this.name,
  });

  factory RelatedModel.fromJson(Map<String, dynamic> json) => RelatedModel(
        type: json["type"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
      };
}

class ImageModel {
  String url;
  String thumb;
  String medium;

  ImageModel({
    required this.url,
    required this.thumb,
    required this.medium,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        url: json["url"],
        thumb: json["thumb"],
        medium: json["medium"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "thumb": thumb,
        "medium": medium,
      };
}
