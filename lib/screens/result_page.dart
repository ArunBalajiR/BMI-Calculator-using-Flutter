import 'package:flutter/material.dart';
import '../constants.dart';
import '../custom_widgets/reusable_card.dart';
// import 'input_page.dart';
import '../custom_widgets/large_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.res, @required this.title, @required this.subtitle});
  final String res;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(20.0),
              child: Text(
                'Your Result',
                style: kNumStyle.copyWith(
                  fontSize: 40,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              clr: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: kResultTxtStyle,
                  ),
                  Text(
                    res,
                    textAlign: TextAlign.center,
                    style: kNumStyle.copyWith(
                      fontSize: 120,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: kResultSubtitletxtStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          LargeButton(
              btntxt: "RE-CALCULATE",
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
