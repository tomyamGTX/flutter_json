import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AyaProvider>(builder: (context, aya, child) {
      return aya.ayah.isNotEmpty
          ? Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Create Json file'),
              ),
              body: Center(
                  child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Loading..',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'QuranIrab', fontSize: 20),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              )))
          : Scaffold(
              body: Container(
                  color: Colors.white,
                  child: const Center(
                      child:
                          Text('No Data. Please parse the json file first'))),
            );
    });
  }
}
