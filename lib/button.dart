import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class button extends StatefulWidget{
  button(this.call, this.reset, {this.bname, this.bicon, this.changer, super.key});

  void Function() call;
  void Function() reset;
  String? bname;
  IconData? bicon;
  // ignore: prefer_typing_uninitialized_variables
  var changer;

  @override
  State<button> createState() => buttonState();
}

// ignore: camel_case_types
class buttonState extends State<button>{



  @override
  Widget build(context){

    String? bbname = widget.bname;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Info Button >><<
        // AnimatedContainer(
        //   decoration: BoxDecoration(
        //     border: Border.all(color: Colors.transparent),
        //     borderRadius: BorderRadius.circular(25),
        //     color: widget.changer==0?Colors.pink:widget.changer==1?Colors.orangeAccent:widget.changer==2?Colors.green:widget.changer==3?Colors.red:Colors.blueGrey,
        //   ),
        //   height: widget.changer==0?2:40,
        //   width: widget.changer==0?0:65,
        //   duration: const Duration(seconds: 1),
        //   curve: Curves.fastEaseInToSlowEaseOut,
        //   child: IconButton(
        //     onPressed: widget.reset,
        //     icon: Icon(
        //       Icons.info_outline,
        //       color: widget.changer==0?Colors.transparent:Colors.white,
        //     ),
        //   ),
        // ),

        const SizedBox(width: 8,),

        //Calculate Button >><<
        AnimatedContainer(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(25),
            color: widget.changer==0?Colors.pink:widget.changer==1?Colors.orangeAccent:widget.changer==2?Colors.green:widget.changer==3?Colors.red:Colors.blueGrey,
          ),
          height: widget.changer==0?52:40,
          width: widget.changer==0?180:150,
          duration: const Duration(seconds: 6),
          curve: Curves.easeInOutCubicEmphasized,
          child: TextButton.icon(
              onPressed: widget.call,
              icon: Icon(
                widget.bicon,
                color: Colors.white,
              ),
              label: Text(
                  '$bbname',
                style: const TextStyle(
                  color: Colors.white
                ),
              ),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(0),
            ),
          ),
        ),


        const SizedBox(width: 8,),

        //Reset Button >><<
        AnimatedContainer(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(25),
            color: widget.changer==0?Colors.pink:widget.changer==1?Colors.orangeAccent:widget.changer==2?Colors.green:widget.changer==3?Colors.red:Colors.blueGrey,
          ),
          // height: widget.changer==0?52:40,
          // width: widget.changer==0?60:70,
          // duration: const Duration(seconds: 4),
          // curve: Curves.easeInOutCubicEmphasized,
          height: widget.changer==0?2:40,
          width: widget.changer==0?0:65,
          duration: const Duration(seconds: 1),
          curve: Curves.fastEaseInToSlowEaseOut,
          child: IconButton(
            onPressed: widget.reset,
            icon: Icon(
              Icons.refresh,
              color: widget.changer==0?Colors.transparent:Colors.white,
            ),
          ),
        ),

      ],
    );
  }
}