import 'package:dendalar/core/constants/app_colors.dart';
import 'package:dendalar/core/constants/app_icons.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/feature/books/pages/book_page.dart';
import 'package:dendalar/feature/dashboard/controller/dashboard_controller.dart';
import 'package:dendalar/feature/main_course/pages/main_course_page.dart';
import 'package:dendalar/feature/profile/pages/profile_page.dart';
import 'package:dendalar/feature/vocabulary/pages/vocabulary_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final dashboardController = Get.find<DashboardController>();

  List<Widget> pages = [
    const MainCoursePage(),
    const VocabularyPage(),
    const BookPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _apiCalling();
    });
  }

  void _apiCalling() {}

  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    double scaleFactor = width / Screen.designWidth;
    return Scaffold(
      body: Obx(() {
        return pages[dashboardController.curentIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        return Container(
          height: height * 0.105,
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: Row(
              children: [
                _buildNavItem(
                  index: 0,
                  icon: AppIcons.mainCourse,
                  label: "Main Course",
                  iconSize: 24,
                  height: height,
                  scaleFactor: scaleFactor,
                ),
                _buildNavItem(
                  index: 1,
                  icon: AppIcons.vocabulary,
                  label: "Vocabulary",
                  iconSize: 24,
                  height: height,
                  scaleFactor: scaleFactor,
                ),
                _buildNavItem(
                  index: 2,
                  icon: AppIcons.books,
                  label: "Books",
                  iconSize: 27,
                  height: height,
                  scaleFactor: scaleFactor,
                ),
                _buildNavItem(
                  index: 3,
                  icon: AppIcons.profile,
                  label: "Profile",
                  iconSize: 28,
                  height: height,
                  scaleFactor: scaleFactor,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String icon,
    required String label,
    required double iconSize,
    required double height,
    required double scaleFactor,
  }) {
    final isSelected = dashboardController.curentIndex.value == index;
    return Expanded(
      child: InkWell(
        onTap: () => dashboardController.changeIndex(index: index),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primaryColor.withValues(alpha: 0.05)
                : Colors.transparent,
            border: Border(
              top: BorderSide(
                color: isSelected ? AppColors.primaryColor : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                height: scaleFactor * iconSize,
                width: scaleFactor * iconSize,
              ),
              Sh(h: 0.008),
              Text(
                label,
                style: GoogleFonts.manrope(
                  fontSize: scaleFactor * 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackout,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
