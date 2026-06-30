import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/utils/buttons/primary_button.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/feature/main_course/controller/sentence_question_controller.dart';
import 'package:dendalar/feature/main_course/widgets/hind_dialog.dart';
import 'package:dendalar/feature/onboarding/widgets/onboarding_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckButton extends StatelessWidget {
  const CheckButton({super.key});

  @override
  Widget build(BuildContext context) {
    final sentenceQuestionController = Get.find<SentenceQuestionController>();

    return OnboardingButtons(
      children: [
        Row(
          children: [
            Expanded(
              flex: 6,
              child: Obx(() {
                return PrimaryButton(
                  onTap: () {
                    sentenceQuestionController.checkAnswer(context: context);
                  },
                  title:
                      sentenceQuestionController.result.value ==
                          MatchResult.correct
                      ? 'CORRECT'
                      : sentenceQuestionController.result.value ==
                            MatchResult.wrong
                      ? 'WRONG'
                      : sentenceQuestionController.hasAttempted.value
                      ? 'CHECK AGAIN'
                      : 'CHECK',
                  backgroundColor:
                      sentenceQuestionController.result.value ==
                          MatchResult.correct
                      ? AppColors.primaryColor
                      : sentenceQuestionController.result.value ==
                            MatchResult.wrong
                      ? AppColors.scarletRose
                      : AppColors.white,
                  shadowColor:
                      sentenceQuestionController.result.value ==
                          MatchResult.correct
                      ? AppColors.zuccini
                      : sentenceQuestionController.result.value ==
                            MatchResult.wrong
                      ? AppColors.winterRed
                      : AppColors.chalice,
                  borderColor:
                      sentenceQuestionController.result.value ==
                          MatchResult.correct
                      ? AppColors.zuccini
                      : sentenceQuestionController.result.value ==
                            MatchResult.wrong
                      ? AppColors.winterRed
                      : AppColors.chalice,
                  fontColor:
                      sentenceQuestionController.result.value ==
                          MatchResult.none
                      ? AppColors.blackout
                      : AppColors.white,
                  icon:
                      sentenceQuestionController.result.value ==
                          MatchResult.correct
                      ? Image.asset(AppIcons.congrats, scale: 4)
                      : sentenceQuestionController.result.value ==
                            MatchResult.wrong
                      ? Image.asset(AppIcons.wrong, scale: 4)
                      : null,
                );
              }),
            ),
            Sw(w: 0.03),
            Expanded(
              flex: 2,
              child: PrimaryButton(
                onTap: () {
                  hindDialog(context: context);
                },
                title: '',
                backgroundColor: AppColors.white,
                shadowColor: AppColors.darkOrange,
                borderColor: AppColors.darkOrange,
                icon: Image.asset(AppIcons.hind, scale: 4),
              ),
            ),
          ],
        ),
        Sh(h: 0.01),
      ],
    );
  }
}
