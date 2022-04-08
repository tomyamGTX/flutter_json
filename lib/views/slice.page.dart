import 'package:flutter/material.dart';
import 'package:flutter_json/providers/aya.providers.dart';
import 'package:provider/provider.dart';

import '../models/slice.index.model.dart';

class SlicePage extends StatefulWidget {
  const SlicePage({Key? key}) : super(key: key);

  @override
  State<SlicePage> createState() => _SlicePageState();
}

class _SlicePageState extends State<SlicePage> {
  int num = 0;
  String textDisplay = '';
  String textSlice = '';
  List<SliceIndex> slice = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AyaProvider>(builder: (context, aya, child) {
      if (aya.ayah.isNotEmpty) {
        textDisplay = aya.ayah[1].text.trim().replaceAll('b', '');
        textSlice = aya.ayah[1].text1.replaceAll('b', '').trim();
      }
      return aya.ayah.isNotEmpty
          ? Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                    'index : ${num + 1}, text: ${textSlice.characters.elementAt(num)}'),
              ),
              body: Center(
                  child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textDisplay.characters.string,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'QuranIrab', fontSize: 20),
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                      textSlice.characters.elementAt(num),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'QuranIrab', fontSize: 20),
                      textDirection: TextDirection.rtl,
                    ),
                    ElevatedButton(
                        onPressed: () => setState(() {
                              if (num < textSlice.characters.length - 1) {
                                num++;
                                slice.add(SliceIndex(
                                  medinaMushafPageId: '',
                                  index: '$num',
                                  text: textSlice.characters.elementAt(num),
                                ));
                              }
                            }),
                        child: const Text('Next Slice'))
                  ],
                ),
              )))
          : Container(
              color: Colors.white,
              child: const Center(child: Text('No Data ...')));
    });
  }
}
