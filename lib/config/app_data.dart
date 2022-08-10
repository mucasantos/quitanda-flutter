import 'package:quitanda/src/models/cart_item_model.dart';
import 'package:quitanda/src/models/item_model.dart';
import 'package:quitanda/src/models/user_mode.dart';

ItemModel apple = ItemModel(
  itemId: 1,
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'Maça',
  price: 5.5,
  unit: 'kg',
);

ItemModel mango = ItemModel(
  itemId: 2,
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/mango.png',
  itemName: 'Mango',
  price: 5.5,
  unit: 'kg',
);
ItemModel papaya = ItemModel(
  itemId: 3,
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Papaya',
  price: 5.5,
  unit: 'kg',
);
ItemModel grape = ItemModel(
  itemId: 4,
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'Grape',
  price: 5.5,
  unit: 'kg',
);
ItemModel guava = ItemModel(
  itemId: 5,
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'Guava',
  price: 5.5,
  unit: 'kg',
);
ItemModel kiwi = ItemModel(
  itemId: 6,
  description:
      'O melhor kiwi da regiao e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida mais saudável.',
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 5.5,
  unit: 'kg',
);
ItemModel chilli = ItemModel(
  itemId: 7,
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/chilli.png',
  itemName: 'Chilli',
  price: 5.5,
  unit: 'kg',
);

ItemModel carrot = ItemModel(
  itemId: 8,
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/carrot.png',
  itemName: 'Cenouras',
  price: 5.5,
  unit: 'kg',
);

ItemModel onion = ItemModel(
  itemId: 9,
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/onion.png',
  itemName: 'Cebolas',
  price: 5.5,
  unit: 'kg',
);

ItemModel potato = ItemModel(
  itemId: 10,
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
List<int> appUserFavorites = [];

UserModel user = UserModel(
    name: "Samuel Santos",
    email: "mucasantos@gmail.com",
    cpf: "999.999.999-99",
    password: "senha",
    phone: "99 9 9999-9999");
