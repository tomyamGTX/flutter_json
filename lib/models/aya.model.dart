// To parse this JSON data, do
//
//     final jsonAyah = jsonAyahFromJson(jsonString);

import 'dart:convert';

Map<String, JsonAyah> jsonAyahFromJson(String str) => Map.from(json.decode(str))
    .map((k, v) => MapEntry<String, JsonAyah>(k, JsonAyah.fromJson(v)));

String jsonAyahToJson(Map<String, JsonAyah> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class JsonAyah {
  JsonAyah({
    required this.aya,
    required this.createdAt,
    required this.id,
    required this.medinaMushafPageId,
    required this.suraId,
    required this.text,
    required this.text1,
    required this.updatedAt,
  });

  String aya;
  DateTime createdAt;
  String id;
  String medinaMushafPageId;
  String suraId;
  String text;
  String text1;
  DateTime updatedAt;

  factory JsonAyah.fromJson(Map<String, dynamic> json) => JsonAyah(
        aya: json["aya"] ?? '',
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"] ?? '',
        medinaMushafPageId: json["medina_mushaf_page_id"] ?? '',
        suraId: json["sura_id"] ?? '',
        text: json["text"] ?? '',
        text1: json["text1"] ?? '',
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "aya": aya,
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "medina_mushaf_page_id": medinaMushafPageId,
        "sura_id": suraId,
        "text": text,
        "text1": text1,
        "updated_at": updatedAt.toIso8601String(),
      };
}
