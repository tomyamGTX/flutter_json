import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../models/slice.index.model.dart';

class AyaProvider extends ChangeNotifier {
  List ayah = [];
  String page = "1";
  List ayahPerPage = [];

  void getAllAyah(List<dynamic> jsonAyah) {
    ayah = jsonAyah;
    notifyListeners();
  }

  void generateJsonData() {
    List<SliceIndex> slice = [];

    for (int i = 0; i < ayah.length; i++) {
      ///todo: get all surah in a page
      if (ayah[i].medinaMushafPageId == page) {
        ayahPerPage.add(ayah[i].text);
      }
    }

    ///todo: combine all list into one string
    String firstAya = ayahPerPage.join();

    ///todo: example slice method
    firstAya.split("");

    // ///todo:add slice data to list object in looping
    for (int i = 0; i < firstAya.split("").length; i++) {
      slice.add(SliceIndex(
        medinaMushafPageId: page,
        index: '$i',
        text: firstAya.split("")[i],
      ));
    }

    ///todo: print the json list
    var json = jsonEncode(JsonIndex(sliceIndex: slice).toJson());
    if (kDebugMode) {
      log(json);
    }
  }

  void nextPage() {
    int no = int.parse(page);
    no++;
    page = '$no';
    notifyListeners();
  }

  void prevPage() {
    int no = int.parse(page);
    no--;
    page = '$no';
    notifyListeners();
  }
}
