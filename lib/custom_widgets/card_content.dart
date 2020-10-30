import "package:flutter/material.dart";
import '../constants.dart';

class CardContent extends StatelessWidget {
  CardContent({@required this.ic, @required this.icontxt});

  final IconData ic;
  final String icontxt;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          ic,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          icontxt,
          style: kTxtStyle,
        ),
      ],
    );
  }
}
