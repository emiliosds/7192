import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 60,
        ),
        Image.asset(
          "assets/images/aog-white.png",
          height: 80,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Álcool ou Gasolina",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontFamily: "Big Shoulders Display",
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
