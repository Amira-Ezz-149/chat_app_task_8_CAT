import 'package:flutter/material.dart';

Color pinkShade400 = Colors.pink.shade400;
Color pinkShade200 = Colors.pink.shade200;

final kSendButtonTextStyle = TextStyle(
  color: pinkShade400,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);


final kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: pinkShade200, width: 2.0),
  ),
);

final kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: pinkShade200, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color:pinkShade200, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

