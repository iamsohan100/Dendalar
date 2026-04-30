import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/utils/app_bar/custom_app_bar.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/main_course/controller/dialog_match_controller.dart';
import 'package:dendalar/feature/main_course/widgets/fill_blank.dart';
import 'package:dendalar/feature/main_course/widgets/match_progress.dart';
import 'package:dendalar/feature/main_course/widgets/word_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogMatchPage extends StatelessWidget {
  const DialogMatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    // double scaleFactor = width / Screen.designWidth;
    final dialogMatchController = Get.find<DialogMatchController>();

    return Scaffold(
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
                    Sh(h: 0.02),
                    MatchProgressMessage(),
                    Sh(h: 0.02),
                    FillBlank(),
                    Sh(h: 0.03),
                    Obx(() {
                      return Wrap(
                        spacing: width * 0.02,
                        runSpacing: height * 0.02,
                        children: [
                          for (
                            int i = 0;
                            i < dialogMatchController.wordList.length;
                            i++
                          )
                            WordCard(
                              onTap: () {
                                if (dialogMatchController.selectedWordList
                                    .contains(
                                      dialogMatchController.wordList[i],
                                    )) {
                                  dialogMatchController.selectedWordList.remove(
                                    dialogMatchController.wordList[i],
                                  );
                                } else {
                                  dialogMatchController.selectedWordList.add(
                                    dialogMatchController.wordList[i],
                                  );
                                }
                              },
                              title: dialogMatchController.wordList[i],
                              isSelected: dialogMatchController.selectedWordList
                                  .contains(dialogMatchController.wordList[i]),
                            ),
                        ],
                      );
                    }),

                    Divider(
                      color: AppColors.chalice.withValues(alpha: 0.5),
                      thickness: 0.5,
                      height: height * 0.065,
                    ),

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
