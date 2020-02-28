import 'package:flutter/material.dart';

const ButtonTextStyle = TextStyle(
  color: Color(0xFF3ec28f),
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const ConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const MessageTextStyle = TextStyle(
  fontFamily: 'montserrat',
  fontSize: 60.0,
);

const TempTextStyle = TextStyle(
  fontFamily: 'montserrat',
  fontSize: 100.0,
);

const MessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Search by Stock Name...',
  border: InputBorder.none,
);

const MessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(width: 1.0, color: Color(0xFFD6D6D6)),
    left: BorderSide(width: 1.0, color: Color(0xFFD6D6D6)),
    right: BorderSide(width: 1.0, color: Color(0xFFD6D6D6)),
    bottom: BorderSide(width: 1.0, color: Color(0xFFD6D6D6)),
  ),
);
