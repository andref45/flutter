import 'dart:convert';

NoticiasModel noticiasModelFromJson(String str) =>
    NoticiasModel.fromJson(json.decode(str));

String noticiasModelToJson(NoticiasModel data) => json.encode(data.toJson());

class NoticiasModel {
  String id;
  String title;
  String description;
  ImageModel image;

  NoticiasModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  factory NoticiasModel.fromJson(Map<String, dynamic> json) => NoticiasModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: ImageModel.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image.toJson(),
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
