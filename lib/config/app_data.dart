import 'package:quitanda/src/models/cart_item_model.dart';
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
  description:
      'O melhor kiwi da regiao e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida mais saudável.',
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 5.5,
  unit: 'kg',
);
ItemModel chilli = ItemModel(
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/chilli.png',
  itemName: 'Chilli',
  price: 5.5,
  unit: 'kg',
);

ItemModel carrot = ItemModel(
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/carrot.png',
  itemName: 'Cenouras',
  price: 5.5,
  unit: 'kg',
);

ItemModel onion = ItemModel(
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/onion.png',
  itemName: 'Cebolas',
  price: 5.5,
  unit: 'kg',
);

ItemModel potato = ItemModel(
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/potato.png',
  itemName: 'Batatas',
  price: 5.5,
  unit: 'kg',
);

List<ItemModel> items = [
  carrot,
  onion,
  potato,
  kiwi,
  apple,
  papaya,
  grape,
  guava,
  mango,
  chilli,
];

List<dynamic> categorias = [
  {'cat': 'Vegetais', 'image': 'assets/images/vegetais.png'},
  {'cat': 'Carnes', 'image': 'assets/images/carnes.png'},
  {'cat': 'Bebidas', 'image': 'assets/images/bebidas.png'},
  {'cat': 'Bolos', 'image': 'assets/images/bolos.png'},
  {'cat': 'Frutas', 'image': 'assets/images/frutas.png'},
];

List<CartItemModel> cartItems = [
  CartItemModel(item: apple, quantity: 2),
  CartItemModel(item: mango, quantity: 4),
  CartItemModel(item: grape, quantity: 1),
  CartItemModel(item: potato, quantity: 3),
];
