import 'package:flutter/material.dart';

Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(164, 217, 163, 0.1),
  100: const Color.fromRGBO(164, 217, 163, 0.2),
  200: const Color.fromRGBO(164, 217, 163, 0.3),
  300: const Color.fromRGBO(164, 217, 163, 0.4),
  400: const Color.fromRGBO(164, 217, 163, 0.5),
  500: const Color.fromRGBO(164, 217, 163, 0.6),
  600: const Color.fromRGBO(164, 217, 163, 0.7),
  700: const Color.fromRGBO(164, 217, 163, 0.8),
  800: const Color.fromRGBO(164, 217, 163, 0.9),
  900: const Color.fromRGBO(164, 217, 163, 1),
};

abstract class CustomColors {
  static Color customContrasColor = Color(0xff907071);
  static Color customAnimatedTextColor = Color(0xfffbdcb0);

  static MaterialColor customSwatchColor =
      MaterialColor(0xffa4d9a3, _swatchOpacity);
}
