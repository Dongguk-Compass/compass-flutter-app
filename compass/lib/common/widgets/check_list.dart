import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // svg Icon 사용을 위한 패키지 import

// Checklist 위젯 : 졸엽 요컨 리스트를 출력하는 위젯
class Checklist extends StatelessWidget {
  // Checklist 클래스는 StatelessWidget을 상속받은 위젯임.
  // 이 위젯은 생성자에서 아래 두 개의 값을 필수로 입력받아야함.
  const Checklist({
    super.key,
    required this.selectedYear, // 교육과정 적용 연도
    required this.userChecklistStatus, // 해당 조건에 대한 String,bool값
  });

  final String selectedYear; // 선택된 연도
  final Map<String, bool> userChecklistStatus; // 조건 충족 여부

  // 연도별 졸업 요선 체크리스트 데이터
  static const Map<String, List<String>> graduationChecklistByYear = {
    '2020': [
      "졸업 논문 심사",
      "최소 전공 이수 63학점",
      "최소 종합 이수 130학점",
      "교양 이수 12학점",
      "계열교육 이수 6학점",
      "자기계발 이수 2학점",
      "인성교육 이수 4학점",
      "공통교육 이수 8학점",
      "사회봉사 30시간",
      "외국어 인증 패스",
      "평점 평균 2.8점",
    ],
    '2025': ['취득학점 2만점', '사회봉사 9만시간', '평점 평균 4.5', '학위 논문 50편'],
  };

  //UI 스타일용 상수 값 정의
  // 다양한 위젯에서 동일하게 사용될만한 값들 상수로 정의해봄
  static const double kBorderRadius = 11; // 둥근 테두리 반지름
  static const Color kBorderColor = Color.fromARGB(
    255,
    215,
    226,
    235,
  ); // 테두리 색상
  static const double kBorderWidth = 1.0; // 테두리 두께

  @override
  Widget build(BuildContext context) {
    // 현재 선택된 연도의 체크리스트 항목 불러오고 없으면 빈 리스트 불러옴
    final checklist = graduationChecklistByYear[selectedYear] ?? [];

    // 최상단 박스 (전체 틀))
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.80,
            // strokeAlign: BorderSide.strokeAlignCenter, // 기본값이라서 주석처리함.
            color: const Color(0xFFD7E2EB),
          ),
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
      ),

      // 체크리스트 내용
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 좌측 정렬
        children: [
          // 제목
          Text(
            '졸업 체크리스트',
            style: TextStyle(
              color: const Color(0xFF263747),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w900,
            ),
          ),

          // 선택된 연도 표시
          Text(
            '$selectedYear년 교육과정 적용',
            style: TextStyle(
              color: const Color(0xFF648394),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 12), // 간격
          // 체크리스트 영역 박스
          Container(
            width: 351,
            decoration: BoxDecoration(
              border: Border.all(color: kBorderColor, width: kBorderWidth),
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),

            // 내부 리스트 박스
            child: Container(
              width: 307,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 13,
              ), // 내부 여백
              decoration: ShapeDecoration(
                color: const Color(0xFFF5F6F7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),

              // 리스트 구성
              child: ListView.separated(
                // .separated는 separatorBuilder를 통해 일정하게 간격을 처리, itemCount만큼의 리스트를 생성함
                // ListView로도 생성 가능하긴한데 .separated가 더 간단해 보임.
                itemCount: checklist.length, // 체크리스트 항목 수 이거 없으면 무한으로 만들어짐.
                separatorBuilder: (_, __) =>
                    const SizedBox(height: 10), // 항목 간 간격
                itemBuilder: (context, index) {
                  final item = checklist[index]; // 항목 이름
                  final isMet = userChecklistStatus[item] ?? false; //충족 여부

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start, // 세로 기준 위 정렬
                    children: [
                      // 조건 충족 여부 아이콘 (SVG로 표시))
                      SvgPicture.asset(
                        isMet // 조건에 따라 아이콘 경로 선택
                            ? 'assets/icon/checkbox_true.svg'
                            : 'assets/icon/checkbox_false.svg',
                        width: 24,
                        height: 24,
                        semanticsLabel: isMet
                            ? 'checkBoxTrue'
                            : 'checkBoxFalse',
                      ),

                      const SizedBox(width: 10), // 아이콘과 텍스트 간격
                      // 항목 이름 텍스트
                      Expanded(
                        child: Text(
                          item,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                shrinkWrap: true, // ListView를 Column 정상적으로 렌더링? 뭔지 모르겠음 없으면 에러남
                // physics: const NeverScrollableScrollPhysics(), // 내부 스크롤 비활성화
              ),
            ),
          ),
        ],
      ),
    );
  }
}
