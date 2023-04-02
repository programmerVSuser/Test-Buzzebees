import '_data_modal_enum_values.dart';

class Subcampaigndetail {
  Subcampaigndetail({
    required this.type,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  String type;
  String name;
  String description;
  String imageUrl;
  String? price;

  factory Subcampaigndetail.fromJson(Map<String, dynamic> json) =>
      Subcampaigndetail(
        type: json["type"]!,
        name: json["name"],
        description: json["description"],
        imageUrl: json["image_url"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
    "type": type,
    "name": name,
    "description": description,
    "image_url": imageUrl,
    "price": price,
  };
}