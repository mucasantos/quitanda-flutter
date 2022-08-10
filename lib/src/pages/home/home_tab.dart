import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
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
  String selectedCategory = 'Frutas';
  List<int> userFavorites = [1, 3, 5];

  void addFavorite(int itemId) {
    setState(() {
      if (userFavorites.contains(itemId)) {
        userFavorites.remove(itemId);
      } else {
        userFavorites.add(itemId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 15, bottom: 10),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            child: const Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
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
                    return DiscountCard();
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
                              addFavorite: addFavorite);
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
                            selectedCategory = appData.categorias[index]['cat'];
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