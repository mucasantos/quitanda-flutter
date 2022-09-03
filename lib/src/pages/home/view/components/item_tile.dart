import 'package:flutter/material.dart';
import 'package:quitanda/config/custom_color.dart';
import 'package:quitanda/src/models/item_model.dart';
import 'package:quitanda/src/pages/product/product_screen.dart';
import 'package:quitanda/src/services/util_services.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;
  final bool isFavorite;
  final Function(String itemId) addFavorite;
  final void Function(GlobalKey key)? cartAnimationMethod;
  final GlobalKey imageGk = GlobalKey();
  ItemTile({
    Key? key,
    required this.item,
    required this.isFavorite,
    required this.addFavorite,
    this.cartAnimationMethod,
  }) : super(key: key);

  // final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              return ProductScreen(
                item: item,
                isFavorite: isFavorite,
              );
            }));
          },
          child: Card(
            elevation: 4,
            shadowColor: Colors.grey.shade300,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Hero(
                    tag: item.imgUrl,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                      child: Image.asset(
                        item.imgUrl,
                        key: imageGk,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Text(
                    item.itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Text(
                        UtilServices.priceToCurrency(item.price),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.customSwatchColor),
                      ),
                      Text(
                        '/${item.unit}',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: () {
              addFavorite(item.objectId);
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  )),
              child: Icon(
                !isFavorite ? Icons.favorite_border_outlined : Icons.favorite,
                color: !isFavorite ? Colors.white : Colors.red,
                size: 25,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 4,
          right: 4,
          child: GestureDetector(
            onTap: cartAnimationMethod == null
                ? null
                : () {
                    cartAnimationMethod!(imageGk);
                  },
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                  color: CustomColors.customSwatchColor,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(14),
                      topLeft: Radius.circular(20))),
              child: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
