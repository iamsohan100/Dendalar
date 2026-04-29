import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/feature/main_course/controller/sentence_match_controller.dart';
import 'package:dendalar/feature/main_course/widgets/word_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectedWord extends StatelessWidget {
  const SelectedWord({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;
    final sentenceMatchController = Get.find<SentenceMatchController>();
    return Obx(() {
      double lineHeight = 70 * scaleFactor;
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: CustomPaint(
          painter: LinePainter(
            lineHeight: lineHeight,
            color: AppColors.chalice,
          ),
          child: Container(
            constraints: BoxConstraints(
              minHeight: lineHeight * 2,
            ), // Always show at least 2 lines
            width: width,
            child: Wrap(
              spacing: width * 0.02,
              runSpacing: 0, // Height is handled by children
              children: sentenceMatchController.selectedWordList
                  .map(
                    (index) => SizedBox(
                      height: lineHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          WordCard(
                            title: sentenceMatchController.wordList[index],
                            isSelected: true,
                            onTap: () {
                              sentenceMatchController.selectedWordList.remove(
                                index,
                              );
                            },
                          ),
                          Sh(h: 0.01), // Gap to sit exactly on the line
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      );
    });
  }
}

class LinePainter extends CustomPainter {
  final double lineHeight;
  final Color color;
  LinePainter({required this.lineHeight, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5;

    // Draw lines every 'lineHeight' pixels
    double y = lineHeight;
    while (y <= size.height + 0.1) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
      y += lineHeight;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
