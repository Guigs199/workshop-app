import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workshop_app/app/modules/forms/ui/stores/user_store.dart';
import 'package:workshop_app/app/shared/utils.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final store = Modular.get<UserStore>();
  final _formKey = GlobalKey<FormState>();

  bool isValid = false;

  @override
  void initState() {
    store.changeName(null);
    super.initState();
  }

  Widget _buildButton() {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: isValid ? PodiColors.purple : PodiColors.purple.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          "PARTICIPAR",
          style: PodiTexts.body1.weightSemibold.withColor(PodiColors.white),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Bem vindo a \nroleta de prêmios",
              style: PodiTexts.heading5.weightBold.withColor(PodiColors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              "Informe seu nome e participe da Roleta\nPodi para concorrer prêmios",
              style: PodiTexts.body1.withColor(PodiColors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Observer(
              builder: (context) => TextFormField(
                initialValue: store.name,
                style: PodiTexts.body1,
                decoration: InputDecorationWidget.simple(
                  hint: "Seu nome",
                  radius: 8,
                ),
                autofocus: true,
                validator: (value) {
                  if (isNull(value)) return "Campo obrigatório";
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    isValid = _formKey.currentState!.validate();
                  });
                  if (isValid) {
                    store.changeName(value);
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
            _buildButton()
          ],
        ),
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
        body: _buildBody());
  }
}
