// To parse this JSON data, do
//
//     final jsonIndex = jsonIndexFromJson(jsonString);

import 'dart:convert';

JsonIndex jsonIndexFromJson(String str) => JsonIndex.fromJson(json.decode(str));

String jsonIndexToJson(JsonIndex data) => json.encode(data.toJson());

class JsonIndex {
  JsonIndex({
    required this.sliceIndex,
  });

  List<SliceIndex> sliceIndex;

  factory JsonIndex.fromJson(Map<String, dynamic> json) => JsonIndex(
        sliceIndex: List<SliceIndex>.from(
            json["slice_index"].map((x) => SliceIndex.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "slice_index": List<dynamic>.from(sliceIndex.map((x) => x.toJson())),
      };
}

class SliceIndex {
  SliceIndex({
    required this.medinaMushafPageId,
    required this.index,
    required this.text,
  });

  String medinaMushafPageId;
  String index;
  String text;

  factory SliceIndex.fromJson(Map<String, dynamic> json) => SliceIndex(
        medinaMushafPageId: json["medina_mushaf_page_id"] ?? '',
        index: json["index"] ?? '',
        text: json["text"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "medina_mushaf_page_id": medinaMushafPageId,
        "index": index,
        "text": text,
      };
}
