import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_json/models/aya.model.dart';

class AyaPage extends StatefulWidget {
  const AyaPage({Key? key}) : super(key: key);

  @override
  State<AyaPage> createState() => _AyaPageState();
}

class _AyaPageState extends State<AyaPage> {
  List jsonAyah = [];

  @override
  void initState() {
    // TODO: implement initState
    getJsonAya();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return jsonAyah.isNotEmpty
        ? Scaffold(
            appBar: AppBar(
              title: Text('Load ${jsonAyah.length} json data'),
            ),
            body: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(
                      jsonAyah[index].text,
                      style: const TextStyle(fontFamily: 'QuranIrab'),
                      textDirection: TextDirection.rtl,
                    );
                  }),
            )),
          )
        : Container(
            color: Colors.white,
            child: const Center(child: CircularProgressIndicator()));
  }

  Future<void> getJsonAya() async {
    String jsonData =
        await rootBundle.loadString("assets/new_quran_fonttext1.json");
    var ayahData = await jsonDecode(jsonData);
    setState(() {
      jsonAyah =
          ayahData.entries.map((e) => JsonAyah.fromJson(e.value)).toList();
    });
  }
}
