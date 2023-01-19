import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workshop_app/app/modules/forms/ui/stores/questions_store.dart';
import 'package:workshop_app/app/modules/forms/ui/stores/user_store.dart';

import '../../../../shared/utils.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final userStore = Modular.get<UserStore>();
  final store = Modular.get<QuestionsStore>();

  Widget _buildPurpleButton() => Observer(builder: (context) {
        return AnimatedOpacity(
          opacity: store.choice != null ? 1 : 0,
          duration: const Duration(milliseconds: 200),
          child: InkWell(
            onTap: store.choice != null
                ? () {
                    store.sendChoice();
                  }
                : null,
            child: Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                color: PodiColors.purple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  "ENVIAR RESPOSTA",
                  style: PodiTexts.body1.weightSemibold
                      .withColor(PodiColors.white),
                ),
              ),
            ),
          ),
        );
      });

  Widget _buildButton({
    required String char,
    required String tittle,
    required bool isCorrect,
  }) =>
      Observer(builder: (context) {
        bool isSelected = (char == store.choice);

        Color? manageColor() {
          Color? color = null;

          if (store.sentChoice) {
            if (isCorrect) {
              color = null;
            } else if (isSelected) {
              color = PodiColors.danger[500];
            }
          } else {
            if (isSelected) {
              color = PodiColors.white;
            }
          }

          return color;
        }

        return InkWell(
          onTap: () {
            store.changeChoice(char);
          },
          child: Container(
            height: 64,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: PodiColors.white),
              borderRadius: BorderRadius.circular(12),
              color: manageColor(),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor:
                      (isSelected && store.sentChoice && !isCorrect)
                          ? PodiColors.danger[600]
                          : PodiColors.green[100],
                  radius: 20,
                  child: Text(
                    char,
                    style: PodiTexts.body1.weightBold
                        .withColor(
                            (isSelected && store.sentChoice && !isCorrect)
                                ? PodiColors.white
                                : PodiColors.green)
                        .heightCenter,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  tittle,
                  style: PodiTexts.body1.weightBold
                      .withColor((isSelected && !store.sentChoice)
                          ? PodiColors.dark
                          : PodiColors.white)
                      .heightCenter,
                )
              ],
            ),
          ),
        );
      });

  Widget _buildInvalid() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Que pena, você errou!",
          style: PodiTexts.theme(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: PodiColors.white),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Observer(
      builder: (context) => Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Oi ${userStore.name}, qual app facilita seu dia-dia no shopping?",
                    style: PodiTexts.heading5.weightBold
                        .withColor(PodiColors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  ...List<Widget>.generate(
                    store.choices.length,
                    (index) => _buildButton(
                        char: store.choices[index].char,
                        tittle: store.choices[index].title,
                        isCorrect: store.choices[index].isCorrect),
                  ).separatedBy(const SizedBox(
                    height: 16,
                  ))
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 16,
            right: 16,
            child: store.verifyChoice ? _buildPurpleButton() : _buildInvalid(),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PodiColors.green,
      appBar: AppBar(
        backgroundColor: PodiColors.green,
        elevation: 0,
        centerTitle: true,
        title: SvgPicture.asset(PodiIcons.logoPodi, color: PodiColors.white),
      ),
      body: _buildBody(),
    );
  }
}
