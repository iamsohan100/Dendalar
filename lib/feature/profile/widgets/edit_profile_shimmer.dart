import 'package:dendalar/core/utils/loading/shimmer_loading.dart';
import 'package:dendalar/core/utils/responsive/screen.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:flutter/material.dart';

class EditProfileShimmer extends StatelessWidget {
  const EditProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    double height = Screen.screenHeight(context);
    double width = Screen.screenWidth(context);
    return Column(
      crossAxisAlignment: .start,
      children: [
        Sh(h: 0.03),
        for (int i = 0; i < 3; i++) ...[
          ShimmerLoading(width: width * 0.5, height: height * 0.025),
          Sh(h: 0.015),
          ShimmerLoading(width: width, height: height * 0.05),
          Sh(h: 0.02),
        ],
      ],
    );
  }
}
