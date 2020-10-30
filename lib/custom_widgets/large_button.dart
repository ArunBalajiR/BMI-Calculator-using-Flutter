import "package:flutter/material.dart";
import '../constants.dart';

class LargeButton extends StatelessWidget {
  LargeButton({@required this.onTap, @required this.btntxt});

  final Function onTap;
  final String btntxt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            btntxt,
            style: kLrgButtonStyle,
          ),
        ),
        height: kContHeight,
        color: kBottomContainerColor,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}
