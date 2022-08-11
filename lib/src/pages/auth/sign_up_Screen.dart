// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda/src/pages/common_widgets/custom_textfield.dart';
import 'package:quitanda/src/pages/common_widgets/header_app.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final phoneFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  const HeaderApp(
                    imagePath: 'assets/images/singup.png',
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CustomTextField(
                          icon: Icons.email,
                          label: "Email",
                        ),
                        const CustomTextField(
                          icon: Icons.lock,
                          label: "Senha",
                          isHidden: true,
                        ),
                        const CustomTextField(
                          icon: Icons.person,
                          label: "Nome",
                        ),
                        CustomTextField(
                          inputFormatter: [phoneFormatter],
                          icon: Icons.phone,
                          label: "Celular",
                        ),
                        CustomTextField(
                          inputFormatter: [cpfFormatter],
                          icon: Icons.file_copy,
                          label: "CPF",
                        ),
                        SizedBox(
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
                      ],
                    ),
                  )
                ],
              ),
              SafeArea(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
