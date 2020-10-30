import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../custom_widgets/reusable_card.dart';
import '../custom_widgets/card_content.dart';
import '../constants.dart';
import '../screens/result_page.dart';
import '../custom_widgets/round_icon_button.dart';
import '../custom_widgets/large_button.dart';
import 'package:demo_app/bmi_logic.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Gender selectedGender;
int height = 170;
int weight = 60;
int age = 18;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        elevation: 30.0,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        clr: selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: CardContent(
                          ic: FontAwesomeIcons.mars,
                          icontxt: "MALE",
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        clr: selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: CardContent(
                          ic: FontAwesomeIcons.venus,
                          icontxt: "FEMALE",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("HEIGHT", style: kTxtStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumStyle,
                          ),
                          Text("cm", style: kTxtStyle),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 2.0,
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: kBottomContainerColor,
                          overlayColor: Color(0x29EB1555),
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 10.0,
                          ),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 20.0,
                          ),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: kMinHeight,
                          max: kMaxHeight,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  clr: kActiveCardColor),
            ),
            Expanded(
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        clr: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("WEIGHT", style: kTxtStyle),
                            Text(weight.toString(), style: kNumStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onInc: () {
                                      setState(() {
                                        weight--;
                                        if (weight <= 0) {
                                          weight = 1;
                                        }
                                      });
                                    }),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onInc: () {
                                      setState(() {
                                        weight++;
                                      });
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: ReusableCard(
                      clr: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("AGE", style: kTxtStyle),
                          Text(age.toString(), style: kNumStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onInc: () {
                                    setState(() {
                                      age--;
                                      if (age <= 0) {
                                        age = 1;
                                      }
                                    });
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onInc: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
            LargeButton(
              btntxt: "CALCULATE",
              onTap: () {
                BMIlogic bmi = BMIlogic(height: height, weight: weight);
                String res = bmi.calculateBMI();
                String title = bmi.getResult();
                String subtitle = bmi.getSubtitle();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                          res: res, title: title, subtitle: subtitle)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
