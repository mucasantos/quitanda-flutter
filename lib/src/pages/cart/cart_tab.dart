import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quitanda/config/app_data.dart' as appData;
import 'package:quitanda/config/custom_color.dart';
import 'package:quitanda/src/services/util_services.dart';

class CartTab extends StatelessWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho')),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: appData.cartItems.length,
                  itemBuilder: (_, index) {
                    return Text(appData.cartItems[index].item.itemName);
                  })),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 3,
                    spreadRadius: 2,
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Total Geral',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  UtilServices.priceToCurrency(50.3),
                  style: TextStyle(
                    fontSize: 23,
                    color: CustomColors.customSwatchColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    )),
                    onPressed: () {},
                    child: const Text('Concluir pedido'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
