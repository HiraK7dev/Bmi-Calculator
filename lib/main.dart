import 'package:bmi_calculator/about.dart';
import 'package:bmi_calculator/input_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const home_page());


// ignore: camel_case_types
class home_page extends StatefulWidget{
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

// ignore: camel_case_types
class _home_pageState extends State<home_page> {

  Widget activeScreen = const input_screen();
  IconData info = Icons.info_outlined;
  var test = 0;
  //changing the screen
  void screenChanger(){
    setState(() {

      if(test == 1) {
        info = Icons.arrow_forward_ios_outlined;
        activeScreen = const input_screen();
        test = 0;
      }
      else{
        info = Icons.arrow_back_ios_new_outlined;
        activeScreen = const About();
        test = 1;
      }

    });
  }

  @override
  Widget build(context){

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      )
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.pink
      ),

      //implementation of system controlled dark-mode
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepOrangeAccent
      ),
      themeMode: ThemeMode.system,

      title: 'BMI Calculator',
      home: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
          toolbarHeight: 90,
          title: const Text(
              'BMI CALCULATOR',
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
           ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () { screenChanger(); }, icon: Icon(info)),
          ],
         ),


      body: ListView(
        children: [Container(
          margin: const EdgeInsets.fromLTRB(20, 40, 18, 0),
          child: Column(
            children: [
              activeScreen
            ],
          ),
        ),
        ]
      ),
      ),
    );
  }
}