import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatBlock extends StatelessWidget {
  final String assetPath;
  final String statTitle;
  final String statValue;
  final String statUnit;

  const StatBlock({
    super.key,
    required this.assetPath, // Path to the SVG asset
    required this.statTitle,
    required this.statValue,
    required this.statUnit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 265,
      height: 96,
      // margin: const,
      padding: const EdgeInsets.only(left: 22, right: 22, top: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: Color.fromARGB(255, 215, 226, 235), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5),
                width: 36,
                height: 36,
                padding: const EdgeInsets.all(6.5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 238, 244, 255),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(assetPath, width: 24, height: 24),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                statTitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1B2B3A),
                ),
              ),
              Row(
                children: [
                  Text(
                    statValue,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1B2B3A),
                    ),
                  ),
                  const SizedBox(width: 2),
                  Text(
                    statUnit,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1B2B3A),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
