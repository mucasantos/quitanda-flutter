import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quitanda/config/custom_color.dart';
import 'package:quitanda/src/models/order_model.dart';
import 'package:quitanda/src/services/util_services.dart';

class PaymenetDialog extends StatelessWidget {
  final OrderModel order;
  const PaymenetDialog({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        16,
      )),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Pagamento com Pix',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                //WRCOD

                QrImage(
                  data: "1234567890lkjkhkjhljh",
                  version: QrVersions.auto,
                  size: 200.0,
                ),

                //VEncimento
                Text(
                  "Vencimento: ${UtilServices.formatDateTime(order.overdueDateTime)}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                //Total
                Text(
                  "Total: ${UtilServices.priceToCurrency(order.total)}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //botão

                OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        side: BorderSide(
                          width: 2,
                          color: CustomColors.customSwatchColor,
                        )),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.copy,
                    ),
                    label: const Text(
                      'Copiar código Pix,',
                    ))
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
  }
}
