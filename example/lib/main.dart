import 'package:flutter/material.dart';
import 'package:easy_box/easy_box.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Box(
          padding: EdgeInsets.all(10),
          backgroundColor: Colors.green,
          alignment: Alignment.center,
          
          child: Text('test'),
          textStyle: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      )
    )
  );
}

