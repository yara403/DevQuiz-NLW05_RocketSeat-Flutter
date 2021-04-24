import 'package:DevQuiz/challenge/challenge_page.dart';
import 'package:DevQuiz/home/home_controler.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/home/widget/appbar/app_bar_widget.dart';
import 'package:DevQuiz/home/widget/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widget/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUset();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success)
      return Scaffold(
        appBar: AppBarWidget(user: controller.user!),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    label: 'Fácil',
                  ),
                  LevelButtonWidget(
                    label: 'Médio',
                  ),
                  LevelButtonWidget(
                    label: 'Difícil',
                  ),
                  LevelButtonWidget(
                    label: 'Perito',
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                  child: GridView.count(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                children: controller.quizzes!
                    .map(
                      (q) => QuizCardWidget(
                        title: q.title,
                        completed:
                            '${q.questionAnswered}/${q.questions.length}',
                        percentage: q.questionAnswered / q.questions.length,
                        questions: q.questions,
                        level: q.level,
                        imagem: q.imagem!,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChallengePage(
                                        questions: q.questions,
                                        title: q.title,
                                      )));
                        },
                      ),
                    )
                    .toList(),
              )),
            ],
          ),
        ),
      );
    else
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
  }
}
