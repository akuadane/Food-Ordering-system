// File for shared styles and properties
import 'package:flut_food/colors.dart';
import 'package:flutter/material.dart';

final kButtonTextStyle = TextStyle(
  color: Color(0xFF58585A),
  fontSize: 32,
  fontWeight: FontWeight.w900,
);

final kInputDecoration = InputDecoration(
    labelText: 'Username',
    labelStyle: TextStyle(color: kSecondaryColor),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)));

const kInputFieldDecoration = InputDecoration(
  focusColor: Colors.white,
  labelStyle: TextStyle(color: Colors.white),
  hintStyle: TextStyle(color: Colors.grey),
  hintText: 'Enter a value',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
);

const kTextFormFieldStyle = TextStyle(
  color: Colors.white,
);
