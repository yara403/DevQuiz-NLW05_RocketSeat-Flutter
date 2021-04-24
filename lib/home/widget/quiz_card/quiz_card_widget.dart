import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completed;
  final double percentage;
  final List<QuestionModel> questions;
  final Level level;
  final String imagem;
  final VoidCallback onTap;

  QuizCardWidget({
    Key? key,
    required this.title,
    required this.completed,
    required this.percentage,
    required this.questions,
    required this.level,
    required this.imagem,
    required this.onTap,
  })   : assert(['blocks', 'laptop', 'hierarchy', 'data'].contains(imagem)),
        super(key: key);

  final imgConfig = {
    "blocks": AppImages.blocks,
    "laptop": AppImages.laptop,
    "hierarchy": AppImages.hierarchy,
    "data": AppImages.data,
  };

  String get appImages => imgConfig[imagem]!;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              child: Image.asset(appImages),
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(
              height: 11,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    completed,
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ProgressIndicatorWidget(
                    value: percentage,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
