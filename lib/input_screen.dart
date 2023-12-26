import 'package:flutter/material.dart';
import 'button.dart';

// ignore: camel_case_types
class input_screen extends StatefulWidget{
  const input_screen({Key? key}): super(key: key);

  @override
  State<input_screen> createState(){
    return input_screenState();
  }
}

// ignore: camel_case_types
class input_screenState extends State<input_screen>{

  // ignore: non_constant_identifier_names
  var bmi_ans = 20;
  var checker = '-------';
  //There are the variables from the former output screen

  var _currentSliderValue = 5.8; //current slider value
  var t1 = TextEditingController();
  // ignore: prefer_typing_uninitialized_variables
  var weight;
  // ignore: prefer_typing_uninitialized_variables
  var height;
  var bmi = '---';
  // ignore: prefer_typing_uninitialized_variables
  var bmi2;
  var anime = 0;
  String bname = 'CALCULATE';
  IconData bicon = Icons.toggle_off_outlined;

  // ignore: non_constant_identifier_names
  void get_ans(){
    setState(() {
        weight = double.parse(t1.text);
        height = _currentSliderValue;
        bmi = calculateBMI(height, weight).toStringAsFixed(1);
        bmi2 = calculateBMI(height, weight);

        //calculation of the state of your bmi score
        if (bmi2 < 18.5) {
          checker = 'UNDER WEIGHT';
          anime = 1;
          //button
          bname = 'RECALCULATE';
          bicon = Icons.toggle_on;
        }
        else if (bmi2 < 24.9 && bmi2 > 18.5) {
          checker = 'HEALTHY';
          anime = 2;
          //button
          bname = 'RECALCULATE';
          bicon = Icons.toggle_on;
        }
        else if (bmi2 < 29.9 && bmi2 > 25.0) {
          checker = 'OVER WEIGHT';
          anime = 3;
          //button
          bname = 'RECALCULATE';
          bicon = Icons.toggle_on;
        }
        else {
          checker = 'OBESE';
          anime = 4;
          //button
          bname = 'RECALCULATE';
          bicon = Icons.toggle_on;
        }
    });
  }

  void reset(){
    setState(() {
      checker = '-------';
      bmi = '---';
      _currentSliderValue = 5.8;
      t1 = TextEditingController(text: '');
      //button
      bname = 'CALCULATE';
      bicon = Icons.toggle_off_outlined;
      anime = 0;
    });
  }

  double calculateBMI(double heightInFeet, double weightInKg){
    double heightInCm = heightInFeet * 30.48;
    double bmi = weightInKg / (heightInCm * heightInCm / 10000);
    //returning the calculated bmi
    return bmi;
  }


  @override
  Widget build(context){
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Color widgetColor = colorScheme.onSurface;
    var sliderOutput = _currentSliderValue.toStringAsFixed(1);

    return AnimatedContainer(
      duration: const Duration(seconds: 5),
      curve: Curves.fastEaseInToSlowEaseOut,
      child: Column(
        children: [

          //Height Input >><<

          Container(
          decoration: const BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(25))
          ),
          child: Column(
            children: [
              const SizedBox(height: 16,),
              Text(
                'HEIGHT',
                style: TextStyle(
                  color: widgetColor,
                  fontSize: 12
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                sliderOutput,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: anime==0?Colors.pink:anime==1?Colors.orangeAccent:anime==2?Colors.green:anime==3?Colors.red:Colors.blueGrey,
                  )
                ),
              const SizedBox(height: 24,),
              SliderTheme(

                data: SliderTheme.of(context).copyWith(
                  valueIndicatorTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                ),

                child: Slider(
                  value: _currentSliderValue,
                  min: 1, // Representing 4 feet (48 inches)
                  max: 8, // Representing 7 feet (84 inches)
                  divisions: 80,
                  activeColor: anime==0?Colors.pink:anime==1?Colors.orangeAccent:anime==2?Colors.green:anime==3?Colors.red:Colors.blueGrey,
                  inactiveColor: Colors.grey,
                  label: 'In Feet',
                  onChanged: (value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 25,),
              ],
            )
          ),

          // Weight Input >><<

          const SizedBox(height: 10,),

          Container(
            decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(25))
            ),
            child: Column(
              children: [
                const SizedBox(height: 16,),
                Text(
                  'WEIGHT',
                  style: TextStyle(
                      color: widgetColor,
                      fontSize: 12
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: '............',
                      hintText: 'In Kilogram',
                      suffixIcon: Icon(Icons.touch_app),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20)
                  ),
                  controller: t1,
                ),
              ],
            ),
          ),

            const SizedBox(height: 10,),


          //output screen >><<


          Container(
            decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(25))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20,),
                Center(
                  child: Text(
                    'BMI SCORE',
                    style: TextStyle(
                            color: widgetColor,
                            fontSize: 12
                        )
                  ),
                ),
                const SizedBox(height: 24,),
                Center(
                  child: Text(
                    bmi,                                                       //The answer will be displayed here
                    style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: anime==0?Colors.pink:anime==1?Colors.orangeAccent:anime==2?Colors.green:anime==3?Colors.red:Colors.blueGrey
                        )
                  ),
                ),
                const SizedBox(height: 14,),
                Center(
                  child: Text(
                    checker,
                    style: TextStyle(
                            color: anime==0?Colors.pink:anime==1?Colors.orangeAccent:anime==2?Colors.green:anime==3?Colors.red:Colors.blueGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                        )
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          button(get_ans, reset, bname: bname, bicon: bicon, changer: anime,)
      ]
      ),
    );
  }
}