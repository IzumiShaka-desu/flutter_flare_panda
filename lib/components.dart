import 'package:flutter/material.dart';
import 'dart:math';
class Chat extends StatelessWidget {
  final double height,width;
  final String text;
  Chat(
  {
    this.text,
    this.height,
    this.width
  }
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Stack(
        children:[
        Positioned(left: 20,
        child: Transform.rotate(
          angle: pi/4,
                  child: Container(
            width: 20,
            height: 20,
            
            decoration:BoxDecoration(color: Colors.white,shape: BoxShape.rectangle)),
        ),),
        Positioned(
          top: 10,
          child: Container(
            width:width,
            padding: EdgeInsets.fromLTRB(10, 8, 10, 5),
            height: height-((25/100)*height),
            decoration: BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(10)),
            child: Text(text),
          ))

        ]),
    );
  }
}
