// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:quitanda/config/app_data.dart' as appData;
import 'package:quitanda/config/custom_color.dart';
import 'package:quitanda/src/models/cart_item_model.dart';
import 'package:quitanda/src/pages/cart/components/cart_tile.dart';
import 'package:quitanda/src/pages/common_widgets/payment_dialog.dart';
import 'package:quitanda/src/services/util_services.dart';

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      appData.cartItems.remove(cartItem);

      UtilServices.showToast(
          message: '${cartItem.item.itemName} removido(a) do carrinho');
    });
  }

  double cartTotalPrice() {
    double total = 0;
    for (var item in appData.cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(title: const Text('Carrinho')),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: appData.cartItems.length,
                  itemBuilder: (_, index) {
                    return CartTile(
                      cartItemModel: appData.cartItems[index],
                      remove: removeItemFromCart,
                    );
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
                  UtilServices.priceToCurrency(cartTotalPrice()),
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
                    onPressed: () async {
                      bool? result = await showOrderConfirmation();
                      if (result ?? false) {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return PaymenetDialog(
                                order: appData.orders.first,
                              );
                            });
                      } else {
                        UtilServices.showToast(
                            message: 'Pedido não confirmado!');
                      }
                    },
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

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text('Confirmação'),
            content: const Text('Deseja realmente concluir o pedido?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Não'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Sim'),
              ),
            ],
          );
        });
  }
}
