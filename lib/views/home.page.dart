import 'package:flutter/material.dart';
import 'package:flutter_json/views/aya.page.dart';
import 'package:flutter_json/views/slice.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AyaPage())),
              child: const Text('Parse Json')),
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SlicePage())),
              child: const Text('Slice Index Json')),
        ],
      ),
    ));
  }
}
