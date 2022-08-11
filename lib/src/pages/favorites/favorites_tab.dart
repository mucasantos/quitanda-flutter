// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:quitanda/config/app_data.dart' as appData;
import 'package:quitanda/src/pages/home/components/item_tile.dart';

class FavoritesTab extends StatefulWidget {
  const FavoritesTab({Key? key}) : super(key: key);

  @override
  State<FavoritesTab> createState() => _FavoritesTabState();
}

void _addFav(int id) {}

class _FavoritesTabState extends State<FavoritesTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Favoritos',
      )),
      body: Column(
        children: [
          Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 9 / 15),
                  itemCount: appData.appUserFavorites.length,
                  itemBuilder: (_, index) {
                    return ItemTile(
                      item: appData.items.firstWhere((element) =>
                          element.itemId == appData.appUserFavorites[index]),
                      isFavorite: true,
                      addFavorite: _addFav,
                      cartAnimationMethod: null,
                    );
                  }))
        ],
      ),
    );
  }
}
