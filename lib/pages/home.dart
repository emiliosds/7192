import 'package:aog/widgets/logo.dart';
import 'package:aog/widgets/submitform.dart';
import 'package:aog/widgets/success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _gasolinaController = new MoneyMaskedTextController();
  var _alcoolController = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Calculando...";
  var _color = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200,
        ),
        color: _color,
        child: ListView(
          children: <Widget>[
            Logo(),
            _completed
                ? Success(
                    result: this._resultText,
                    function: reset,
                  )
                : SubmitForm(
                    gasolinaController: this._gasolinaController,
                    alcoolController: this._alcoolController,
                    busy: this._busy,
                    function: calculate,
                  ),
          ],
        ),
      ),
    );
  }

  Future calculate() {
    double alcool = double.parse(
            _alcoolController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;
    double gasolina = double.parse(
            _gasolinaController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;
    double result = alcool / gasolina;

    setState(() {
      this._completed = false;
      this._busy = true;
      this._color = Colors.red;
    });

    return new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _resultText = result >= 0.7
            ? "Compensa utilizar Gasolina."
            : "Compensa utilizar Álcool.";

        this._completed = true;
        this._busy = false;
      });
    });
  }

  reset() {
    setState(() {
      _gasolinaController = new MoneyMaskedTextController();
      _alcoolController = new MoneyMaskedTextController();
      _completed = false;
      _busy = false;
      this._color = Colors.deepPurple;
    });
  }
}
