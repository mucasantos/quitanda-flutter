import 'package:flutter/material.dart';
import 'package:quitanda/src/models/cart_item_model.dart';
import 'package:quitanda/src/models/order_model.dart';
import 'package:quitanda/src/pages/orders/components/order_status_widget.dart';
import 'package:quitanda/src/services/util_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel orderData;
  const OrderTile({
    Key? key,
    required this.orderData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          initiallyExpanded: orderData.status == 'pending_payment',
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pedido: ${orderData.orderId.toString()}'),
              Text(
                UtilServices.formatDateTime(orderData.createdDateTime),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              )
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 150,
                        child: ListView(
                          children: orderData.items.map((orderItem) {
                            return _OrderItemWidget(
                              orderItem: orderItem,
                            );
                          }).toList(),
                        ),
                      )),
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: orderData.status,
                      isOverdue:
                          orderData.overdueDateTime.isBefore(DateTime.now()),
                    ),
                  )
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  children: [
                    const TextSpan(
                        text: 'Total  ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: UtilServices.priceToCurrency(
                      orderData.total,
                    ))
                  ]),
            ),
            Visibility(
              visible: orderData.status == 'pending_payment',
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                    14,
                  ))),
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/pix.png",
                    height: 18,
                  ),
                  label: const Text('Ver QR Code Pix')),
            )
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  final CartItemModel orderItem;
  const _OrderItemWidget({
    Key? key,
    required this.orderItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              orderItem.item.itemName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            UtilServices.priceToCurrency(orderItem.totalPrice()),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
