// import 'package:dendalar/core/constants/app_images.dart';
// import 'package:dendalar/core/utils/app_bar/custom_app_bar.dart';
// import 'package:dendalar/core/utils/responsive/screen.dart';
// import 'package:dendalar/core/utils/responsive/sized_box.dart';
// import 'package:dendalar/core/utils/widgets/background.dart';
// import 'package:dendalar/core/utils/widgets/display_network_image.dart';
// import 'package:dendalar/core/utils/widgets/empty_data.dart';
// import 'package:dendalar/feature/main_course/controller/chapter_and_lesson_controller.dart';
// import 'package:dendalar/feature/main_course/widgets/chapter_divider.dart';
// import 'package:dendalar/feature/main_course/widgets/level_completed_dialog.dart';
// import 'package:dendalar/routes/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ChapterPage extends StatefulWidget {
//   const ChapterPage({super.key});

//   @override
//   State<ChapterPage> createState() => _ChapterPageState();
// }

// class _ChapterPageState extends State<ChapterPage> {
//   final chapterAndLessonController = Get.find<ChapterAndLessonController>();
//   @override
//   Widget build(BuildContext context) {
//     // double height = Screen.screenHeight(context);
//     double width = Screen.screenWidth(context);
//     double scaleFactor = width / Screen.designWidth;
//     return Scaffold(
//       body: Background(
//         child: Column(
//           children: [
//             CustomAppBar(),
//             Expanded(
//               child: SingleChildScrollView(
//                 reverse: true,
//                 child: Obx(() {
//                   final chapterList =
//                       chapterAndLessonController.chapterModel.value.data;
//                   final lessongList =
//                       chapterAndLessonController.lessonModel.value.data;
//                   if ((chapterList == null || chapterList.isEmpty) ||
//                       (lessongList == null || lessongList.isEmpty)) {
//                     return EmptyData(
//                       bottomMargin: 0.4,
//                       title: 'Nothing to explore yet!',
//                       icon: Icons.explore_outlined,
//                       description:
//                           'Check back later for exciting chapter and lessons.',
//                     );
//                   }

//                   return Column(
//                     mainAxisAlignment: .center,
//                     crossAxisAlignment: .center,
//                     children: [
//                       Sh(h: 0.05),
//                       for (int i = 0; i < chapterList.length; i++) ...[
//                         Sh(h: 0.015),

//                         ChapterDivider(name: chapterList[i].name ?? ''),

//                         Sh(h: 0.015),
//                         for (int j = 0; j < lessongList.length; j++) ...[
//                           if (i == 0 && j == 0)
//                             Image.asset(AppImages.summaryChapter, scale: 4),
//                           if (lessongList[j].isLocked == true)
//                             Image.asset(AppImages.lockChapter, scale: 4)
//                           else if (lessongList[j].isComplete == true)
//                             GestureDetector(
//                               onTap: () {
//                                 levelCompletedDialog(context: context);
//                               },
//                               child: Image.asset(
//                                 AppImages.completedChapter,
//                                 scale: 4,
//                               ),
//                             )
//                           else
//                             Stack(
//                               clipBehavior: .none,
//                               fit: .loose,
//                               alignment: .center,
//                               children: [
//                                 GestureDetector(
//                                   onTap: () {
//                                     Get.toNamed(AppRoutes.sentenceMatchPage);
//                                   },
//                                   child: Stack(
//                                     alignment: .center,
//                                     children: [
//                                       Image.asset(AppImages.chapter, scale: 4),
//                                       DisplayNetworkImage(
//                                         imageUrl: lessongList[j].icon,
//                                         imageWidth: scaleFactor * 40,
//                                         imageHeight: scaleFactor * 40,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 if (lessongList[j].isLocked == false &&
//                                     lessongList[j].isComplete == false)
//                                   Positioned(
//                                     left: -55,
//                                     child: Image.asset(
//                                       AppImages.chapterCount,
//                                       scale: 4,
//                                     ),
//                                   ),
//                               ],
//                             ),
//                         ],
//                       ],

//                       // Image.asset(AppImages.alphabetPlus, scale: 4),
//                       // Image.asset(AppImages.summaryChapter, scale: 4),
//                       // Image.asset(AppImages.lockChapter, scale: 4),
//                       // Image.asset(AppImages.lockChapter, scale: 4),
//                       // Sh(h: 0.02),
//                       // Image.asset(AppImages.alphabet, scale: 4),
//                       // Sh(h: 0.02),
//                       // Image.asset(AppImages.lockChapter, scale: 4),

//                       // GestureDetector(
//                       //   onTap: () => Get.toNamed(AppRoutes.dialogMatchPage),
//                       //   child: Image.asset(AppImages.chapter, scale: 4),
//                       // ),
//                       // Stack(
//                       //   clipBehavior: .none,
//                       //   fit: .loose,
//                       //   alignment: .center,
//                       //   children: [
//                       //     GestureDetector(
//                       //       onTap: () {
//                       //         Get.toNamed(AppRoutes.sentenceMatchPage);
//                       //       },
//                       //       child: Image.asset(AppImages.chapter, scale: 4),
//                       //     ),
//                       //     Positioned(
//                       //       left: -55,
//                       //       child: Image.asset(
//                       //         AppImages.chapterCount,
//                       //         scale: 4,
//                       //       ),
//                       //     ),
//                       //   ],
//                       // ),
//                       // GestureDetector(
//                       //   onTap: () {
//                       //     levelCompletedDialog(context: context);
//                       //   },
//                       //   child: Stack(
//                       //     alignment: .center,
//                       //     children: [
//                       //       Image.asset(AppImages.chapter, scale: 4),
//                       //       Image.asset(AppImages.verify, scale: 10),
//                       //     ],
//                       //   ),
//                       // ),
//                     ],
//                   );
//                 }),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:dendalar/core/constants/app_images.dart';
import 'package:dendalar/core/utils/app_bar/custom_app_bar.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/core/utils/widgets/display_network_image.dart';
import 'package:dendalar/core/utils/widgets/empty_data.dart';
import 'package:dendalar/feature/main_course/controller/chapter_and_lesson_controller.dart';
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
                  final chapterList =
                      chapterAndLessonController.chapterModel.value.data;
                  final lessonList =
                      chapterAndLessonController.lessonModel.value.data;

                  if ((chapterList == null || chapterList.isEmpty) ||
                      (lessonList == null || lessonList.isEmpty)) {
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
                      const Sh(h: 0.05),
                      ..._buildChapters(
                        context: context,
                        chapterList: chapterList,
                        lessonList: lessonList,
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

  // চ্যাপ্টার লিস্ট বিল্ড করার জন্য আলাদা method
  List<Widget> _buildChapters({
    required BuildContext context,
    required List<ChapterData> chapterList,
    required List<LessonData> lessonList,
    required double scaleFactor,
  }) {
    return List.generate(chapterList.length, (i) {
      return Column(
        children: [
          const Sh(h: 0.015),
          ChapterDivider(name: chapterList[i].name ?? ''),
          const Sh(h: 0.015),
          ..._buildLessons(
            context: context,
            isFirstChapter: i == 0,
            lessonList: lessonList,
            scaleFactor: scaleFactor,
          ),
        ],
      );
    });
  }

  // লেসন লিস্ট বিল্ড করার জন্য আলাদা method
  List<Widget> _buildLessons({
    required BuildContext context,
    required bool isFirstChapter,
    required List<LessonData> lessonList,
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

  // একটা সিঙ্গেল লেসন আইটেম বিল্ড করার method
  Widget _buildLessonItem({
    required BuildContext context,
    required LessonData lesson,
    required double scaleFactor,
  }) {
    if (lesson.isLocked == true) {
      return Image.asset(AppImages.lockChapter, scale: 4);
    }

    if (lesson.isComplete == true) {
      return GestureDetector(
        onTap: () => levelCompletedDialog(context: context),
        child: Image.asset(AppImages.completedChapter, scale: 4),
      );
    }

    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.loose,
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.sentenceMatchPage),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppImages.chapter, scale: 4),
              DisplayNetworkImage(
                imageUrl: lesson.icon,
                imageWidth: scaleFactor * 40,
                imageHeight: scaleFactor * 40,
              ),
            ],
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