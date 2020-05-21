import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  var busy = false;
  var invert = false;
  Function function;
  var text = "";

  LoadingButton({
    @required this.busy,
    @required this.invert,
    @required this.function,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            margin: EdgeInsets.all(30),
            alignment: Alignment.center,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(60),
            ),
            child: CircularProgressIndicator(
              backgroundColor: Colors.white.withOpacity(0),
            ),
          )
        : Container(
            margin: EdgeInsets.all(30),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: invert
                  ? Theme.of(context).primaryColor
                  : Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(60),
            ),
            child: FlatButton(
              onPressed: function,
              child: Text(
                text.toUpperCase(),
                style: TextStyle(
                  color:
                      !invert ? Theme.of(context).primaryColor : Colors.white,
                  fontSize: 26,
                  fontFamily: "Big Shoulders Display",
                ),
              ),
            ),
          );
  }
}
