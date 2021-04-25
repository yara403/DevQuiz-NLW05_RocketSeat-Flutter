import 'package:DevQuiz/challenge/widget/next_button/next_button_widget.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatefulWidget {
  final String title;
  final int lenght;
  final int result;

  const ResultPage({
    Key? key,
    required this.title,
    required this.lenght,
    required this.result,
  }) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String congratMsg() {
    if ((widget.result / widget.lenght) >= 0.7) return "Parabéns!";
    if ((widget.result / widget.lenght) >= 0.5)
      return "Bom, mas precisa melhorar!";
    return "Estude um pouco mais";
  }

  String congratImg() {
    if ((widget.result / widget.lenght) >= 0.7) return AppImages.trophy;
    if ((widget.result / widget.lenght) >= 0.5) return AppImages.alert;
    return AppImages.error;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(congratImg()),
            Column(
              children: [
                Text(
                  congratMsg(),
                  style: AppTextStyles.heading40,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                    text: "Você concluiu",
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                        text: "\n${widget.title}",
                        style: AppTextStyles.bodyBold,
                      ),
                      TextSpan(
                        text:
                            "\ncom ${widget.result} de ${widget.lenght} acertos.",
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                  style: AppTextStyles.heading40,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.purple(
                          label: 'Compartilhar',
                          onTap: () {
                            Share.share(
                                "Resultado do Quiz: ${widget.title} \nObtive ${(widget.result / widget.lenght) * 100}% de aproveitamento!");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.white(
                          label: 'Voltar ao início',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
