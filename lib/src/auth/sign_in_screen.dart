import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/config/custom_color.dart';
import 'package:quitanda/src/auth/components/custom_textfield.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: CustomColors.customSwatchColor,
                        borderRadius: BorderRadius.lerp(
                            const BorderRadius.only(
                                bottomLeft: Radius.circular(500)),
                            const BorderRadius.only(
                                bottomRight: Radius.circular(350)),
                            0.8),
                      ),
                    ),
                    Positioned(
                      bottom: -30,
                      top: 50,
                      right: 10,
                      child: Image.asset('assets/images/image1.png'),
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
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CustomTextField(
                      icon: Icons.email,
                      label: 'Nome',
                    ),
                    const CustomTextField(
                      isHidden: true,
                      icon: Icons.lock,
                      label: 'Senha',
                    ),
                    SizedBox(
                      // width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14))),
                        onPressed: () {},
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Esqueceu a senha?'),
                      ),
                    ),

                    //Divisor
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Divider(
                              thickness: 2,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text('Ou'),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Botão de novo usuário

                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14)),
                            side: BorderSide(
                              width: 1,
                              color: CustomColors.customSwatchColor,
                            )),
                        onPressed: () {},
                        child: const Text(
                          'Criar conta',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
