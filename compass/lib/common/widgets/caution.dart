import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Caution extends StatelessWidget {
  // Caution 클래스는 상태를 가지지 않는 위젯이다. <- 타이머 키고 다른페이지 어쩌구 저쩌구
  const Caution({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 832,
      height: 87,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      decoration: BoxDecoration(
        color: const Color(0xFFEAECF3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 왼쪽 아이콘
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset(
              'assets/icon/fi-sr-info.svg',
              width: 24,
              height: 24,
              semanticsLabel: 'Info Icon',
            ),
          ),
          // 오른쪽 텍스트 블록
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  child: Text(
                    '유의 사항',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      height: 1.0,
                      color: Color(0xFF44576C),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  child: Text(
                    '본 Compass 리포트는 사용자의 동의를 얻어 첨부받은 학사 데이터에 기반하고 있습니다.',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 1.0,
                      color: Color(0xFF44576C),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                const SizedBox(
                  child: Text(
                    '본 리포트는 졸업사정 판별을 위한 참고 목적으로 활용할 수 있도록 제공되며, 증빙 등의 다른 목적으로는 사용할 수 없습니다.',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 1.0,
                      color: Color(0xFF44576C),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
