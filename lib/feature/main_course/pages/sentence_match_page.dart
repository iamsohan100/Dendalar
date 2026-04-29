import 'package:dendalar/core/utils/app_bar/custom_app_bar.dart';
import 'package:dendalar/core/utils/responsive/sized_box.dart';
import 'package:dendalar/core/utils/widgets/background.dart';
import 'package:dendalar/feature/main_course/widgets/match_progress.dart';
import 'package:dendalar/feature/main_course/widgets/sentence_card.dart';
import 'package:flutter/material.dart';

class SentenceMatchPage extends StatelessWidget {
  const SentenceMatchPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Sh(h: 0.03),
                    MatchProgressMessage(),
                    Sh(h: 0.03),
                    SentenceCard(
                      msg: 'This is my mother',
                      alignment: .centerLeft,
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
