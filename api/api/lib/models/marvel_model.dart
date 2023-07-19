class MarvelModel {
  int id;
  String name;
  String description;
  String thumbnailUrl;

  MarvelModel({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnailUrl,
  });

  factory MarvelModel.fromJson(Map<String, dynamic> json) {
    return MarvelModel(
      id: json["id"],
      name: json["name"],
      description: json["description"] ?? "No description available.",
      thumbnailUrl:
          "${json['thumbnail']['path']}.${json['thumbnail']['extension']}",
    );
  }
}
