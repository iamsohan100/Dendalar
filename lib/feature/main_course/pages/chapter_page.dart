import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/app_bar/custom_app_bar.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/main_course/widgets/level_completed_dialog.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChapterPage extends StatelessWidget {
  const ChapterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            CustomAppBar(),
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,
                  children: [
                    Sh(h: 0.05),
                    Image.asset(AppImages.alphabetPlus, scale: 4),
                    Image.asset(AppImages.summaryChapter, scale: 4),
                    Image.asset(AppImages.lockChapter, scale: 4),
                    Image.asset(AppImages.lockChapter, scale: 4),
                    Image.asset(AppImages.lockChapter, scale: 4),

                    Sh(h: 0.02),
                    Image.asset(AppImages.alphabet, scale: 4),
                    Sh(h: 0.02),
                    Image.asset(AppImages.lockChapter, scale: 4),
                    Image.asset(AppImages.msgChapter, scale: 4),
                    Stack(
                      clipBehavior: .none,
                      fit: .loose,
                      alignment: .center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.sentenceMatchPage);
                          },
                          child: Image.asset(AppImages.bookChapter, scale: 4),
                        ),
                        Positioned(
                          left: -55,
                          child: Image.asset(AppImages.chapterCount, scale: 4),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        levelCompletedDialog(context: context);
                      },
                      child: Image.asset(AppImages.completedChapter, scale: 4),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
