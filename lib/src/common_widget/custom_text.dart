import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomText(String head, double fontsize, Color? color){
  return Text(
    head,
    style: TextStyle(
        fontSize: fontsize,
        fontWeight: FontWeight.bold,
        color: color),
  );
}