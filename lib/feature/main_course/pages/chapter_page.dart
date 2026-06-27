import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/app_bar/custom_app_bar.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/core/utils/widgets/empty_data.dart';
import 'package:dendalar/feature/main_course/controller/chapter_and_lesson_controller.dart';
import 'package:dendalar/feature/main_course/controller/dialog_match_controller.dart';
import 'package:dendalar/feature/main_course/controller/sentence_question_controller.dart';
import 'package:dendalar/feature/main_course/model/chapter_model.dart';
import 'package:dendalar/feature/main_course/model/lesson_model.dart';
import 'package:dendalar/feature/main_course/widgets/chapter_divider.dart';
import 'package:dendalar/feature/main_course/widgets/level_completed_dialog.dart';
import 'package:dendalar/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChapterPage extends StatefulWidget {
  const ChapterPage({super.key});

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  final chapterAndLessonController = Get.find<ChapterAndLessonController>();
  final sentenceQuestionController = Get.find<SentenceQuestionController>();
  final dialogMatchController = Get.find<DialogMatchController>();
  @override
  Widget build(BuildContext context) {
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;

    return Scaffold(
      body: Background(
        child: Column(
          children: [
            CustomAppBar(),
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Obx(() {
                  final chapterList = chapterAndLessonController
                      .chapterModel
                      .value
                      .chapterList
                      ?.reversed;

                  if (chapterList == null || chapterList.isEmpty) {
                    return const EmptyData(
                      bottomMargin: 0.4,
                      title: 'Nothing to explore yet!',
                      icon: Icons.explore_outlined,
                      description:
                          'Check back later for exciting chapter and lessons.',
                    );
                  }

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Sh(h: 0.01),
                      ..._buildChapters(
                        context: context,
                        chapterList: chapterList.toList(),
                        scaleFactor: scaleFactor,
                      ),
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

  List<Widget> _buildChapters({
    required BuildContext context,
    required List<ChapterData> chapterList,
    required double scaleFactor,
  }) {
    return List.generate(chapterList.length, (i) {
      final lessonList = chapterList[i].lessonList?.reversed ?? [];

      return Column(
        children: [
          const Sh(h: 0.015),
          ChapterDivider(name: chapterList[i].name ?? ''),
          const Sh(h: 0.015),
          ..._buildLessons(
            context: context,
            isFirstChapter: i == 0,
            lessonList: lessonList.toList(),
            scaleFactor: scaleFactor,
          ),
        ],
      );
    });
  }

  List<Widget> _buildLessons({
    required BuildContext context,
    required bool isFirstChapter,
    required List<LessonModel> lessonList,
    required double scaleFactor,
  }) {
    return List.generate(lessonList.length, (j) {
      final lesson = lessonList[j];
      final isFirstLesson = isFirstChapter && j == 0;

      return Column(
        children: [
          if (isFirstLesson) Image.asset(AppImages.summaryChapter, scale: 4),
          _buildLessonItem(
            context: context,
            lesson: lesson,
            scaleFactor: scaleFactor,
          ),
        ],
      );
    });
  }

  Widget _buildLessonItem({
    required BuildContext context,
    required LessonModel lesson,
    required double scaleFactor,
  }) {
    if (lesson.isLocked == true) {
      return Image.asset(AppImages.lockChapter, scale: 4);
    } else if (lesson.isCompleted == true) {
      return GestureDetector(
        onTap: () => levelCompletedDialog(context: context),
        child: Image.asset(AppImages.completedChapter, scale: 4),
      );
    } else {
      return Stack(
        clipBehavior: Clip.none,
        fit: StackFit.loose,
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (lesson.lessonType == 'SENTENCE') {
                getSentenceQuestion(lesson.id ?? '');
              } else {
                getDialogQuestion(lesson.id ?? '');
              }
            },
            child: Image.asset(
              lesson.lessonType == 'SENTENCE'
                  ? AppImages.bookChapter
                  : AppImages.msgChapter,
              scale: 4,
            ),
          ),
          Positioned(
            left: -55,
            child: Image.asset(AppImages.chapterCount, scale: 4),
          ),
        ],
      );
    }
  }

  Future<void> getSentenceQuestion(String lessonId) async {
    final response = await sentenceQuestionController.getSentenceQuestion(
      context: context,
      lessonId: lessonId,
    );
    if (response) {
      Get.toNamed(AppRoutes.sentenceMatchPage);
    }
  }

  Future<void> getDialogQuestion(String lessonId) async {
    final response = await dialogMatchController.getDialogQuestion(
      context: context,
      lessonId: lessonId,
      page: 1,
    );
    if (response) {
      Get.toNamed(AppRoutes.dialogMatchPage);
    }
  }
}
