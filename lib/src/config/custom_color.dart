import 'package:flutter/material.dart';

Map<int, Color> _swatchOpacity = {
  50: const Color.fromRGBO(76, 173, 115, 0.1),
  100: const Color.fromRGBO(76, 173, 115, 0.2),
  200: const Color.fromRGBO(76, 173, 115, 0.3),
  300: const Color.fromRGBO(76, 173, 115, 0.4),
  400: const Color.fromRGBO(76, 173, 115, 0.5),
  500: const Color.fromRGBO(76, 173, 115, 0.6),
  600: const Color.fromRGBO(76, 173, 115, 0.7),
  700: const Color.fromRGBO(76, 173, 115, 0.8),
  800: const Color.fromRGBO(76, 173, 115, 0.9),
  900: const Color.fromRGBO(76, 173, 115, 1),
};

abstract class CustomColors {
  static Color customContrasColor = const Color(0xff907071);
  static Color customAnimatedTextColor = const Color(0xfffbdcb0);
  static Color customCardGreenColor = const Color(0xff60DEB1);

  static MaterialColor customSwatchColor =
      MaterialColor(0xff4CAD73, _swatchOpacity);
}
