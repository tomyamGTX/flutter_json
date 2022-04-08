import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_json/models/aya.model.dart';
import 'package:flutter_json/providers/aya.providers.dart';
import 'package:provider/provider.dart';

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
        ? Consumer<AyaProvider>(builder: (context, aya, child) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  TextButton(
                      onPressed: int.parse(aya.page) > 0
                          ? () =>
                              Provider.of<AyaProvider>(context, listen: false)
                                  .prevPage()
                          : null,
                      child: const Text(
                        "Prev",
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: int.parse(aya.page) < 604
                          ? () =>
                              Provider.of<AyaProvider>(context, listen: false)
                                  .nextPage()
                          : null,
                      child: const Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
                title: Text('Ayah Page ${aya.page}'),
              ),
              body: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: ListView.builder(
                            itemCount: jsonAyah.length,
                            itemBuilder: (BuildContext context, int index) {
                              ///todo: display page 1 only
                              if (jsonAyah[index].medinaMushafPageId ==
                                  aya.page) {
                                return Text(
                                  jsonAyah[index].text,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontFamily: 'QuranIrab', fontSize: 20),
                                  textDirection: TextDirection.rtl,
                                );
                              }
                              return Container();
                            }),
                      ),
                    ],
                  ),
                ),
              )),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () =>
                    Provider.of<AyaProvider>(context, listen: false)
                        .generateJsonData(),
                label: const Text('Create json data per page'),
              ),
            );
          })
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
      Provider.of<AyaProvider>(context, listen: false).getAllAyah(jsonAyah);
    });
  }
}
