import '_data_modal_enum_values.dart';
import '_data_modal_subcampaigndetail.dart';

class DataModalAashboard {
  DataModalAashboard({
    required this.type,
    required this.name,
    required this.size,
    required this.subcampaigndetails,
    required this.description,
    required this.imageUrl,
  });

  String type;
  String? name;
  String? size;
  String? description;
  String? imageUrl;
  List<Subcampaigndetail>? subcampaigndetails;

  factory DataModalAashboard.fromJson(Map<String, dynamic> json) =>
      DataModalAashboard(
        type:json["type"]!,
        name: json["name"],
        size: json["size"],
        description: json["description"],
        imageUrl: json["image_url"],
        subcampaigndetails: json["subcampaigndetails"] == null
            ? []
            : List<Subcampaigndetail>.from(json["subcampaigndetails"]!.map((x) => Subcampaigndetail.fromJson(x))),

      );

  Map<String, dynamic> toJson() => {
    "type":type,
    "name": name,
    "size": size,
    "description": description,
    "image_url": imageUrl,
    "subcampaigndetails": subcampaigndetails == null
        ? []
        : List<dynamic>.from(subcampaigndetails!.map((x) => x.toJson())),

  };
}