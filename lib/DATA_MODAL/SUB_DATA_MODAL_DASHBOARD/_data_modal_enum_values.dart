
enum Type { HEADER, CAMPAIGN_ROTATE, CAMPAIGN }

final typeValues = EnumValues({
  "campaign": Type.CAMPAIGN,
  "campaign_rotate": Type.CAMPAIGN_ROTATE,
  "header": Type.HEADER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}