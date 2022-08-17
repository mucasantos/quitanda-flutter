import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/src/pages/auth/controller/auth_controller.dart';
import 'package:quitanda/src/pages/common_widgets/custom_textfield.dart';
import 'package:quitanda/src/services/validators.dart';

class ForgotPasswordDialog extends StatelessWidget {
  final emailController = TextEditingController();
  ForgotPasswordDialog({
    Key? key,
    required String email,
  }) : super(key: key) {
    emailController.text = email;
  }

  final formFieldKey = GlobalKey<FormFieldState>();

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(alignment: Alignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Recuperação de Senha',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                  bottom: 20,
                ),
                child: Text(
                  'Digite o seu email para recuperação de senha',
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
              ),
              CustomTextField(
                formFieldKey: formFieldKey,
                controller: emailController,
                icon: Icons.email,
                label: 'Email',
                validator: emailValidator,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    side: const BorderSide(
                      width: 2,
                      color: Colors.green,
                    )),
                onPressed: () {
                  if (formFieldKey.currentState!.validate()) {
                    authController.recoverPassword(emailController.text);
                    Get.back(result: true);
                  }
                },
                child: const Text('Recuperar senha',
                    style: TextStyle(
                      fontSize: 13,
                    )),
              )
            ],
          ),
        ),
        Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
              ),
            ))
      ]),
    );
  }
}
