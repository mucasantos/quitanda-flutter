// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:quitanda/config/app_data.dart' as appData;
import 'package:quitanda/config/custom_color.dart';
import 'package:quitanda/src/pages/common_widgets/custom_textfield.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Perfil do usuário",
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
              ))
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.email,
            icon: Icons.email,
            label: 'Email',
          ),
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.fullname,
            icon: Icons.person,
            label: 'Nome',
          ),
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.phone,
            icon: Icons.phone,
            label: 'Celular',
          ),
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.cpf,
            icon: Icons.file_copy,
            label: 'CPF',
            isHidden: true,
          ),
          SizedBox(
            height: 50,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: CustomColors.customSwatchColor),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                      16,
                    ))),
                onPressed: () {
                  updatePassword();
                },
                child: const Text(
                  "Atualizar senha",
                )),
          )
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
        context: context,
        builder: (builder) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "Atualização de senha",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: CustomColors.customSwatchColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const CustomTextField(
                        isHidden: true,
                        icon: Icons.lock,
                        label: "Senha atual",
                      ),
                      const CustomTextField(
                        isHidden: true,
                        icon: Icons.lock_outline,
                        label: "Nova atual",
                      ),
                      const CustomTextField(
                        isHidden: true,
                        icon: Icons.lock_outline,
                        label: "Confirmar nova atual",
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    color: CustomColors.customSwatchColor),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                  16,
                                ))),
                            onPressed: () {},
                            child: const Text('Atualizar')),
                      )
                    ],
                  ),
                ),
                Positioned(
                    top: 5,
                    right: 5,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close,
                        )))
              ],
            ),
          );
        });
  }
}
