// ignore_for_file: library_prefixes

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quitanda/config/app_data.dart' as appData;

import 'package:quitanda/config/custom_color.dart';
import 'package:quitanda/src/pages/home/components/category_tile.dart';
import 'package:quitanda/src/pages/home/components/discount_card.dart';
import 'package:quitanda/src/pages/home/components/item_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  GlobalKey<CartIconKey> gkCart = GlobalKey<CartIconKey>();
  String selectedCategory = 'Frutas';
  List<int> userFavorites = appData.appUserFavorites;

  late Function(GlobalKey) runAddToCardAnimation;

  void itemSelectedCartAnimation(GlobalKey gkImage) {
    runAddToCardAnimation(gkImage);
  }

  void _addFavorite(int itemId) {
    if (userFavorites.contains(itemId)) {
      setState(() {
        userFavorites.remove(itemId);
      });

      //  appData.appUserFavorites.remove(itemId);
    } else {
      setState(() {
        userFavorites.add(itemId);
      });
      //  appData.appUserFavorites.add(itemId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddToCartAnimation(
        gkCart: gkCart,
        rotation: true,
        dragToCardCurve: Curves.easeIn,
        dragToCardDuration: const Duration(milliseconds: 100),
        previewCurve: Curves.linearToEaseOut,
        previewDuration: const Duration(milliseconds: 500),
        previewHeight: 30,
        previewWidth: 30,
        opacity: 0.85,
        receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
          // You can run the animation by addToCardAnimationMethod, just pass trough the the global key of  the image as parameter
          runAddToCardAnimation = addToCardAnimationMethod;
        },
        child: Stack(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: CustomColors.customSwatchColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 15, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text.rich(TextSpan(
                              style: const TextStyle(
                                fontSize: 20,
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, right: 20),
                          child: GestureDetector(
                            onTap: () {},
                            child: Badge(
                              badgeColor: CustomColors.customContrasColor,
                              badgeContent: const Text(
                                '2',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              child: AddToCartIcon(
                                key: gkCart,
                                icon: const Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          hintText: 'Pesquise aqui',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400, fontSize: 14),
                          fillColor: Colors.white,
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none)),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 250,
              //bottom: 100,
              child: SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: 13,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return const DiscountCard();
                    })),
              ),
            ),
            Positioned(
                top: 400,
                child: SizedBox(
                  height: 360,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridView.builder(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 9 / 15),
                          itemCount: appData.items.length,
                          itemBuilder: (_, index) {
                            return ItemTile(
                              item: appData.items[index],
                              isFavorite: userFavorites
                                  .contains(appData.items[index].itemId),
                              addFavorite: _addFavorite,
                              cartAnimationMethod: runAddToCardAnimation,
                            );
                          })),
                )),
            Positioned(
                top: 160,
                child: SizedBox(
                  //  padding: const EdgeInsets.only(left: 25),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return CategoryTile(
                          onPressed: () {
                            setState(() {
                              selectedCategory =
                                  appData.categorias[index]['cat'];
                            });
                          },
                          category: appData.categorias[index]['cat'],
                          isSelected: appData.categorias[index]['cat'] ==
                              selectedCategory,
                          image: appData.categorias[index]['image'],
                        );
                      },
                      separatorBuilder: (_, index) => const SizedBox(
                            width: 10,
                          ),
                      itemCount: appData.categorias.length),
                ))
          ],
        ),
      ),
    );
  }
}


/*
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text.rich(TextSpan(
            style: const TextStyle(
              fontSize: 20,
            ),
            children: [
              TextSpan(
                text: 'Green',
                style: TextStyle(
                  color: CustomColors.customSwatchColor,
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 20),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeColor: CustomColors.customContrasColor,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSwatchColor,
                ),
              ),
            ),
          )
        ],
      ),
      */