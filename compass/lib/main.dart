import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import './common/widgets/stat_block.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String statValue = '';

  @override
  void initState() {
    super.initState();
    loadStatValue();
  }

  Future<void> loadStatValue() async {
    final String response = await rootBundle.loadString(
      'assets/dummy/test_dummy.json',
    );
    final data = json.decode(response);
    setState(() {
      statValue = data['value'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: const Color.fromARGB(255, 225, 233, 240),
      home: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StatBlock(
              assetPath: 'assets/icon/school.svg',
              statTitle: '이수한 학점',
              statValue: statValue.isEmpty ? '...' : statValue,
              statUnit: '학점',
            ),
            StatBlock(
              assetPath: 'assets/icon/calculator.svg',
              statTitle: '취득 평점 평균',
              statValue: '3.58',
              statUnit: '점',
            ),
            StatBlock(
              assetPath: 'assets/icon/arrow_grow.svg',
              statTitle: '성적 향상률',
              statValue: '25.04',
              statUnit: '%',
            ),
          ],
        ),
      ),
    );
  }
}
