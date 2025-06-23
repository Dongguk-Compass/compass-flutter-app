// 체크리스트 위젯 import (파일명은 lower_case_with_underscores 스타일 준수)
import 'package:compass/common/widgets/check_list.dart';

import 'package:flutter/material.dart';
import 'dart:convert'; // JSON 디코딩을 위해 사용
import 'package:flutter/services.dart'; // 로컬 asset 파일 불러오기 위해 사용

// 앱 시작점
void main() {
  runApp(const MainApp()); // MainApp 위젯을 루트로 실행
}

// StatefulWidget으로 선언한 MainApp (상태 변경이 필요하므로)
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

// MainApp의 상태 클래스
class _MainAppState extends State<MainApp> {
  // 선택된 졸업 연도 저장 변수
  String selectedYear = '';

  // 사용자의 졸업 요건 충족 여부를 담는 Map
  Map<String, bool> userChecklistStatus = {};

  // 데이터 로딩 완료 여부 확인용 플래그
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    loadSateValue(); // 앱 시작 시 JSON 파일에서 데이터 불러오기 (오타 있음. 실제 함수명과 일치해야 함)
  }

  // assets/dummy/test_dummy.json 파일에서 데이터를 비동기적으로 읽어오는 함수
  Future<void> loadSateValue() async {
    final String response = await rootBundle.loadString(
      'assets/dummy/test_dummy.json', // 로컬 assets 폴더 내 JSON 경로
    );
    final data = json.decode(response); // 문자열을 Map 형태로 디코딩

    // 상태 변경: JSON에서 읽은 데이터를 UI에 반영
    setState(() {
      selectedYear = data['selectedYear']; // 연도 정보
      userChecklistStatus = Map<String, bool>.from(
        data['userChecklistStatus'],
      ); // 체크리스트 상태
      isLoaded = true; // 로딩 완료 표시
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: const Color.fromARGB(255, 225, 233, 240), // 전체 앱 배경색
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              // JSON에서 불러온 값을 Checklist 위젯에 전달
              Checklist(
                selectedYear: selectedYear,
                userChecklistStatus: userChecklistStatus,
              ),
            ],
          ),
        ),
        // Checklist를 Column으로 감싸야 ListView height 계산 문제 방지
      ),
    );
  }
}
