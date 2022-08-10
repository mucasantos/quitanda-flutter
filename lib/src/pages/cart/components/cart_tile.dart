import 'package:flutter/material.dart';
import 'package:quitanda/config/custom_color.dart';
import 'package:quitanda/src/models/cart_item_model.dart';
import 'package:quitanda/src/pages/common_widgets/quantity_widget.dart';
import 'package:quitanda/src/services/util_services.dart';

class CartTile extends StatefulWidget {
  final Function(CartItemModel) remove;
  final CartItemModel cartItemModel;
  const CartTile({
    Key? key,
    required this.cartItemModel,
    required this.remove,
  }) : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        14.0,
      )),
      child: ListTile(
        leading: Image.asset(
          widget.cartItemModel.item.imgUrl,
          height: 60,
          width: 60,
        ),
        title: Text(
          widget.cartItemModel.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          UtilServices.priceToCurrency(widget.cartItemModel.totalPrice()),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: CustomColors.customSwatchColor,
          ),
        ),
        trailing: QuantityWidget(
          calcQuantity: (quantity) {
            setState(() {
              widget.cartItemModel.quantity = quantity;

              if (widget.cartItemModel.quantity == 0) {
                widget.remove(widget.cartItemModel);
              }
            });
          },
          suffixText: widget.cartItemModel.item.unit,
          value: widget.cartItemModel.quantity,
          isRemovable: true,
        ),
      ),
    );
  }
}
