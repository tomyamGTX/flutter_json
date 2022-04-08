import 'package:flutter/cupertino.dart';

class AyaProvider extends ChangeNotifier {
  List ayah = [];

  void getAllAyah(List<dynamic> jsonAyah) {
    ayah = jsonAyah;
    notifyListeners();
  }
}
