import 'package:dendalar/core/utils/app_bar/custom_app_bar.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/main_course/controller/sentence_match_controller.dart';
import 'package:dendalar/feature/main_course/widgets/check_button.dart';
import 'package:dendalar/feature/main_course/widgets/match_progress.dart';
import 'package:dendalar/feature/main_course/widgets/selected_word.dart';
import 'package:dendalar/feature/main_course/widgets/sentence_card.dart';
import 'package:dendalar/feature/main_course/widgets/word_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SentenceMatchPage extends StatelessWidget {
  const SentenceMatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    // double scaleFactor = width / Screen.designWidth;
    final sentenceMatchController = Get.find<SentenceMatchController>();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CheckButton(),
      body: Background(
        child: Column(
          children: [
            CustomAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .center,
                  children: [
                    Sh(h: 0.03),
                    MatchProgressMessage(),
                    Sh(h: 0.03),
                    SentenceCard(
                      msg: 'This is my mother',
                      alignment: .centerLeft,
                    ),
                    Sh(h: 0.04),
                    SelectedWord(),
                    Sh(h: 0.1),

                    Obx(() {
                      return Wrap(
                        spacing: width * 0.02,
                        runSpacing: height * 0.02,
                        children: [
                          for (
                            int i = 0;
                            i < sentenceMatchController.wordList.length;
                            i++
                          )
                            if (!sentenceMatchController.selectedWordList
                                .contains(i))
                              WordCard(
                                onTap: () {
                                  sentenceMatchController.selectedWordList.add(
                                    i,
                                  );
                                },
                                title: sentenceMatchController.wordList[i],
                                isSelected:
                                    false, // Always false since we only show unselected ones
                              ),
                        ],
                      );
                    }),

                    Sh(h: 0.1),
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
