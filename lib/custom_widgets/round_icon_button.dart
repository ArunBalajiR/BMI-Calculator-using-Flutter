import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, this.onInc});

  final IconData icon;
  final Function onInc;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onInc,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 48.0,
        height: 48.0,
      ),
      elevation: 6.0,
      shape: CircleBorder(),
    );
  }
}
