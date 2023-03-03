import 'package:flutter/material.dart';

Color logoOrange = Color.fromRGBO(247, 147, 33, 1);

Color logoBlue = Color.fromRGBO(28, 128, 195, 1);

const LinearGradient blueGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color.fromRGBO(18, 118, 188, 1),
    Color.fromRGBO(37, 167, 223, 1),
  ],
);

const LinearGradient orangeGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color.fromRGBO(242, 99, 43, 0.9),
    Color.fromRGBO(252, 176, 67, 0.9),
  ],
);

Color appBarLightTheme = Color.fromRGBO(250, 250, 250, 1);

Color appBarDarkTheme = Colors.black12.withOpacity(0.01);

Color orderTileColor = Color.fromRGBO(66, 158, 179, 0.7);
Color fadedBlue = Color.fromRGBO(156, 193, 222, 1);
Color logoWhiteBackground = Colors.white;
