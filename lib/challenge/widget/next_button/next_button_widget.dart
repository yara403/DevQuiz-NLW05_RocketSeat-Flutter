import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;

  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.onTap,
  }) : super(key: key);

  NextButtonWidget.green({required String label, required this.onTap})
      : this.backgroundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.label = label,
        this.borderColor = AppColors.green;

  NextButtonWidget.white({required String label, required this.onTap})
      : this.backgroundColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.label = label,
        this.borderColor = AppColors.border;

  NextButtonWidget.purple({required String label, required this.onTap})
      : this.backgroundColor = AppColors.purple,
        this.fontColor = AppColors.white,
        this.label = label,
        this.borderColor = AppColors.green;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        child: TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(AppColors.green),
                backgroundColor:
                    MaterialStateProperty.all(this.backgroundColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                side: MaterialStateProperty.all(
                    BorderSide(color: this.borderColor))),
            onPressed: onTap,
            child: Text(
              label,
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: this.fontColor),
            )));
  }
}
