import 'package:bmi_calculator/ResultPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'container.dart';
import 'bmicalculator.dart';

const colorrrr = Color(0xFF111328);
const activecolor = Color(0xFF1D1E33);
Color maleclr = colorrrr;
Color femclr = colorrrr;
int height = 150;
int weight = 50;
int age = 30;
enum Gender { male, female }
Gender selectedgender;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedgender = Gender.male;

                    //  updatecolor(Gender.male);
                  });
                },
                child: InputsContainer(
                    selectedgender == Gender.male ? activecolor : colorrrr,
                    Child(
                      icon: FontAwesomeIcons.mars,
                      txt: 'Male',
                    )),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedgender = Gender.female;
                  });
                },
                child: InputsContainer(
                    selectedgender == Gender.female ? activecolor : colorrrr,
                    Child(
                      icon: FontAwesomeIcons.venus,
                      txt: 'Female',
                    )),
              ))
            ],
          )),
          Expanded(
              child: InputsContainer(
                  colorrrr,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Height',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF8D8E98),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Cm',
                            style: TextStyle(color: Color(0xFF8D8E98)),
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.grey[700],
                            overlayColor: Color(0x29EB1555),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                            thumbColor: Colors.pink[700],
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 14.0,
                            )),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 200,
                            onChanged: (double newval) {
                              setState(() {
                                height = newval.round();
                              });

                              print(newval);
                            }),
                      )
                    ],
                  ))),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: InputsContainer(
                      colorrrr,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Weight',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF8D8E98),
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Buttonn(
                                  icon: FontAwesomeIcons.minus,
                                  onPressedd: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                              Buttonn(
                                icon: FontAwesomeIcons.plus,
                                onPressedd: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ))),
              Expanded(
                  child: InputsContainer(
                      colorrrr,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Age',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF8D8E98),
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Buttonn(
                                  icon: FontAwesomeIcons.minus,
                                  onPressedd: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              Buttonn(
                                  icon: FontAwesomeIcons.plus,
                                  onPressedd: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                            ],
                          )
                        ],
                      )))
            ],
          )),
          GestureDetector(
            onTap: () {
              BMICalculator bmi = BMICalculator(weight, height);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(bmi.calcbmi(),
                          bmi.getresult(), bmi.getinterpretation())));
            },
            child: Container(
              width: double.infinity,
              height: 50,
              color: Colors.pink[500],
              child: Center(
                  child: Text('CALCULATE',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold))),
            ),
          )
        ],
      ),
    );
  }
}

class Buttonn extends StatelessWidget {
  Buttonn({this.icon, this.onPressedd});
  final IconData icon;
  final Function onPressedd;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        size: 20,
        color: Colors.white,
      ),
      onPressed: onPressedd,
      elevation: 6,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 60, height: 50),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
