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

class _WheelPageState extends State<WheelPage> {
  final store = Modular.get<WheelStore>();

  @override
  void initState() {
    store.fetchGifts();
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

    return correctAnswer();
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
      items: store.gifts
          .map(
            (e) => FortuneItem(
              child: Text(
                e.name,
                style:
                    PodiTexts.heading5.weightBold.withColor(PodiColors.white),
              ),
              style: FortuneItemStyle(
                circleRatio: 0.4,
                axis: Axis.horizontal,
                color: PodiColors.purple,
                borderWidth: 0,
                gradient: LinearGradient(
                  colors: [PodiColors.purple[300]!, PodiColors.purple[600]!],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        "GIRAR ROLETA",
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
        backgroundColor: PodiColors.green,
        appBar: AppBar(
          backgroundColor: PodiColors.green,
          elevation: 0,
          centerTitle: true,
          title: SvgPicture.asset(PodiIcons.logoPodi, color: PodiColors.white),
        ),
        body: _buildBody(),
      ),
    );
  }
}
