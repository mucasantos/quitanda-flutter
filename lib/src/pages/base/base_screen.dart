import 'package:flutter/material.dart';
import 'package:quitanda/config/custom_color.dart';
import 'package:quitanda/src/pages/cart/cart_tab.dart';
import 'package:quitanda/src/pages/home/home_tab.dart';

class BaseScreen extends StatefulWidget {
  BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomeTab(),
          CartTab(),
          Container(color: Colors.purple),
          Container(color: Colors.yellow),
          Container(color: Colors.pink),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
                pageController.jumpToPage(index);
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: CustomColors.customSwatchColor,
            selectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Carrinho',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Produtos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline_outlined),
                label: 'Favoritos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Perfil',
              ),
            ]),
      ),
    );
  }
}
