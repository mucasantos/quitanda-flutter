import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/config/custom_color.dart';

class HeaderApp extends StatelessWidget {
  final String imagePath;
  const HeaderApp({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: CustomColors.customSwatchColor,
              borderRadius: BorderRadius.lerp(
                  const BorderRadius.only(bottomLeft: Radius.circular(500)),
                  const BorderRadius.only(bottomRight: Radius.circular(350)),
                  0.8),
            ),
          ),
          Positioned(
            bottom: -30,
            top: 50,
            right: 10,
            child: Image.asset(imagePath),
          ),
          Positioned(
            left: 10,
            bottom: 0,
            child: Column(
              children: [
                Text.rich(TextSpan(
                    style: const TextStyle(
                      fontSize: 40,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Green',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Grocery',
                        style: TextStyle(
                          color: CustomColors.customContrasColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])),
                SizedBox(
                  height: 50,
                  child: DefaultTextStyle(
                    style: TextStyle(
                        fontSize: 35,
                        color: CustomColors.customAnimatedTextColor),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      pause: Duration.zero,
                      animatedTexts: [
                        FadeAnimatedText('Frutas'),
                        FadeAnimatedText('Verduras'),
                        FadeAnimatedText('Legumes'),
                        FadeAnimatedText('Carnes'),
                        FadeAnimatedText('Cereais'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
