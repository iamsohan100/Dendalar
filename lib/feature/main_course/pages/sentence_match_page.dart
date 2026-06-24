import 'package:dendalar/core/utils/app_bar/custom_app_bar.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/core/utils/widgets/empty_data.dart';
import 'package:dendalar/feature/main_course/controller/sentence_question_controller.dart';
import 'package:dendalar/feature/main_course/widgets/check_button.dart';
import 'package:dendalar/feature/main_course/widgets/match_progress.dart';
import 'package:dendalar/feature/main_course/widgets/selected_word.dart';
import 'package:dendalar/feature/main_course/widgets/sentence_card.dart';
import 'package:dendalar/feature/main_course/widgets/word_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SentenceMatchPage extends StatefulWidget {
  const SentenceMatchPage({super.key});

  @override
  State<SentenceMatchPage> createState() => _SentenceMatchPageState();
}

class _SentenceMatchPageState extends State<SentenceMatchPage> {
  final sentenceQuestionController = Get.find<SentenceQuestionController>();

  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    // double scaleFactor = width / Screen.designWidth;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CheckButton(),
      body: Background(
        child: Column(
          children: [
            CustomAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Obx(() {
                  final quesitonList = sentenceQuestionController.quesitonList;

                  if (quesitonList == null || quesitonList.isEmpty) {
                    return const EmptyData(
                      topMargin: 0.22,
                      title: 'No questions available yet!',
                      icon: Icons.explore_outlined,
                      description:
                          'Check back later for new questions to test your knowledge.',
                    );
                  }

                  final currentIndex =
                      sentenceQuestionController.currentIndex.value;

                  return Column(
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .center,
                    children: [
                      Sh(h: 0.02),
                      MatchProgressMessage(),
                      Sh(h: 0.02),
                      SentenceCard(
                        msg: quesitonList[currentIndex].sentenceInEnglish ?? '',
                        alignment: .centerLeft,
                      ),
                      Sh(h: 0.04),
                      SelectedWord(),
                      Sh(h: 0.1),

                      Wrap(
                        spacing: width * 0.02,
                        runSpacing: height * 0.02,
                        children: [
                          for (
                            int i = 0;
                            i < sentenceQuestionController.wordList.length;
                            i++
                          )
                            if (!sentenceQuestionController.selectedWordList
                                .contains(i))
                              WordCard(
                                onTap: () {
                                  sentenceQuestionController.selectedWordList
                                      .add(i);
                                },
                                title: sentenceQuestionController.wordList[i],
                                isSelected:
                                    false, // Always false since we only show unselected ones
                              ),
                        ],
                      ),

                      Sh(h: 0.1),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
