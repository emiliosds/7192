import 'package:aog/widgets/input.dart';
import 'package:aog/widgets/loadingbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class SubmitForm extends StatelessWidget {
  var gasolinaController = new MoneyMaskedTextController();
  var alcoolController = new MoneyMaskedTextController();
  var busy = false;
  Function function;

  SubmitForm({
    @required this.gasolinaController,
    @required this.alcoolController,
    @required this.busy,
    @required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Input(label: "Gasolina", controller: gasolinaController),
        Input(label: "Álcool", controller: alcoolController),
        LoadingButton(
          busy: busy,
          invert: false,
          function: function,
          text: "Calcular",
        )
      ],
    );
  }
}
