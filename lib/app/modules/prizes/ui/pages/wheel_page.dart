import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workshop_app/app/shared/components/background_painter.dart';

import '../../../../shared/components/indicator_painter.dart';
import '../../../../shared/utils.dart';
import '../stores/wheel_stores.dart';

class WheelPage extends StatefulWidget {
  const WheelPage({super.key});

  @override
  State<WheelPage> createState() => _WheelPageState();
}

class _WheelPageState extends State<WheelPage> 
with SingleTickerProviderStateMixin {
  final store = Modular.get<WheelStore>();

  late Animation<Color?> colorTween;

  @override
  void initState() {
    store.colorTweenController = AnimationController(vsync: this, duration: kThemeChangeDuration);
    colorTween = ColorTween(
      begin: PodiColors.green,
      end: PodiColors.warning[400],
    ).animate(store.colorTweenController!);
    colorTween.addListener(() {setState(() {
      
    });});
    super.initState();
  }

  Widget _buildInfo() {
    Widget correctAnswer() {
      return Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(PodiIcons.starsCheck),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Resposta Correta!",
            style: PodiTexts.heading5.weightBold.withColor(PodiColors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Arraste a roleta ou toque no botão e veja se é seu dia de sorte.",
            style: PodiTexts.body1.withColor(PodiColors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ));
    }

    Widget showResult() {
      final sizeFactor = (MediaQuery.of(context).size.width - 96) / 280;
      return Stack(
        children: [
          Positioned(
            left: 48,
            right: 48,
            child: SvgPicture.asset(
              store.selectedGift != null
                  ? PodiIcons.backgroundStarsSuccess
                  : PodiIcons.backgroundStarsFail,
              height: sizeFactor * 280,
              width: sizeFactor * 280,
            ),
          ),
          Positioned(
            left: 32,
            right: 32,
            top: sizeFactor * (store.selectedGift != null ? 76 : 48),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (store.selectedGift == null) ...[
                  Image.asset(
                    PodiIcons.failEmoji,
                    height: sizeFactor * 186,
                  ),
                  Text(
                    "Ops!",
                    style: PodiTexts.heading5.weightBold,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Azar no jogo sorte no amor.\nConvide alguém para jantar.",
                    textAlign: TextAlign.center,
                    style: PodiTexts.body1,
                  ),
                ] else
                  ...[
                    Container(
                      height: sizeFactor * 128,
                      width: sizeFactor * 128,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: PodiColors.white,
                      ),
                      foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(store.selectedGift!.photo),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Text(
                    "Wow, você ganhou!",
                    style: PodiTexts.heading5.weightBold.withColor(PodiColors.white),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Hoje foi seu dia de sorte, toque em avançar para ver como resgatar seu prêmio.",
                    textAlign: TextAlign.center,
                    style: PodiTexts.body1.withColor(PodiColors.white),
                  ),
                  ],
              ],
            ),
          ),
        ],
      );
    }

    return AnimatedOpacity(
      opacity: store.drawing ? 0 : 1,
      duration: kThemeChangeDuration,
      child: !store.didDraw || store.drawing ? correctAnswer() : showResult(),
      );
  }

  Widget _buildWheel() {
    return FortuneWheel(
      indicators: [
        FortuneIndicator(
          child: CustomPaint(
            painter: IndicatorPainter(400 * 0.6),
            size: const Size(242, 59),
          ),
          alignment: const Alignment(0, -0.625),
        ),
      ],
      items: store.wheelItems,
      animateFirst: false,
      onAnimationStart: () {
        store.start();
      },
      onAnimationEnd: () {
        store.endDrawing();
      },
      onFling: store.draw,
      selected: store.stream,
    );
  }

  Widget _buildButton() {
    return AnimatedOpacity(
      duration: kThemeChangeDuration,
      opacity: store.drawing ? 0 : 1,
      child: ElevatedButton(
        onPressed: () {
          if (store.drawing) return;
          if (store.didDraw) {
            if (store.didLose) {
              Modular.to.pushReplacementNamed(PodiPages.userPage());
            } else {}
          } else {
            store.draw();
          }
        },
        child: Text(
          store.didDraw
              ? store.selectedGift != null
                  ? "AVANÇAR"
                  : "TENTAR NOVAMENTE"
              : "GIRAR ROLETA",
          style: PodiTexts.body1.weightBold,
        ),
        style: BasicButtonStyle(
          backgroundColor: PodiColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          child: CustomPaint(
            painter: BackgroundPainter(),
          ),
          height: 820,
          width: 820,
          bottom: -470,
        ),
        Positioned(
          child: _buildInfo(),
          left: 16,
          right: 16,
          bottom: 360,
          top: 0,
        ),
        Positioned(
          child: _buildWheel(),
          height: 800,
          width: 800,
          bottom: -460,
        ),
        Positioned(
          child: _buildButton(),
          bottom: 16 + MediaQuery.of(context).viewPadding.bottom,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        backgroundColor: colorTween.value,
        appBar: AppBar(
          backgroundColor: colorTween.value,
          elevation: 0,
          centerTitle: true,
          title: SvgPicture.asset(PodiIcons.logoPodi, color: PodiColors.white),
        ),
        body: _buildBody(),
      ),
    );
  }
}
