import 'package:quitanda/src/models/item_model.dart';

ItemModel apple = ItemModel(
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'Maça',
  price: 5.5,
  unit: 'kg',
);

ItemModel mango = ItemModel(
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/mango.png',
  itemName: 'Mango',
  price: 5.5,
  unit: 'kg',
);
ItemModel papaya = ItemModel(
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Papaya',
  price: 5.5,
  unit: 'kg',
);
ItemModel grape = ItemModel(
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'Grape',
  price: 5.5,
  unit: 'kg',
);
ItemModel guava = ItemModel(
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'Guava',
  price: 5.5,
  unit: 'kg',
);
ItemModel kiwi = ItemModel(
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 5.5,
  unit: 'kg',
);

List<ItemModel> items = [
  kiwi,
  apple,
  papaya,
  grape,
  guava,
  mango,
];

List<dynamic> categorias = [
  {'cat': 'Vegetais', 'image': 'assets/images/vegetais.png'},
  {'cat': 'Carnes', 'image': 'assets/images/carnes.png'},
  {'cat': 'Bebidas', 'image': 'assets/images/bebidas.png'},
  {'cat': 'Bolos,', 'image': 'assets/images/bolos.png'},
  {'cat': 'Carnes,', 'image': 'assets/images/carnes.png'},
];
