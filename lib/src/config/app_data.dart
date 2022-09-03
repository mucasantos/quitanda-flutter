import 'package:quitanda/src/models/cart_item_model.dart';
import 'package:quitanda/src/models/item_model.dart';
import 'package:quitanda/src/models/order_model.dart';
import 'package:quitanda/src/models/user_model.dart';

ItemModel apple = ItemModel(
  objectId: '1',
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'Maça',
  price: 5.5,
  unit: 'kg',
);

ItemModel mango = ItemModel(
  objectId: '2',
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/mango.png',
  itemName: 'Mango',
  price: 5.5,
  unit: 'kg',
);
ItemModel papaya = ItemModel(
  objectId: '3',
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Papaya',
  price: 5.5,
  unit: 'kg',
);
ItemModel grape = ItemModel(
  objectId: '4',
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'Grape',
  price: 5.5,
  unit: 'kg',
);
ItemModel guava = ItemModel(
  objectId: '5',
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'Guava',
  price: 5.5,
  unit: 'kg',
);
ItemModel kiwi = ItemModel(
  objectId: '6',
  description:
      'O melhor kiwi da regiao e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida mais saudável.',
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 5.5,
  unit: 'kg',
);
ItemModel chilli = ItemModel(
  objectId: '7',
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/chilli.png',
  itemName: 'Chilli',
  price: 5.5,
  unit: 'kg',
);

ItemModel carrot = ItemModel(
  objectId: '8',
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/carrot.png',
  itemName: 'Cenouras',
  price: 5.5,
  unit: 'kg',
);

ItemModel onion = ItemModel(
  objectId: '9',
  description: 'A melhor maça da regiao',
  imgUrl: 'assets/fruits/onion.png',
  itemName: 'Cebolas',
  price: 5.5,
  unit: 'kg',
);

ItemModel potato = ItemModel(
  objectId: '10',
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
    fullname: "Samuel Santos",
    email: "mucasantos@gmail.com",
    cpf: "999.999.999-99",
    password: "senha",
    phone: "99 9 9999-9999");

List<OrderModel> orders = [
  OrderModel(
    orderId: "001",
    items: [
      CartItemModel(item: apple, quantity: 2),
      CartItemModel(item: grape, quantity: 3),
    ],
    copyAndPast: "copyAndPast",
    createdDateTime: DateTime.parse(
      "2022-09-08 10:00:10.458",
    ),
    overdueDateTime: DateTime.parse(
      "2022-09-08 11:00:10.458",
    ),
    status: 'pending_payment',
    total: 0,
  ),
  OrderModel(
    orderId: "002",
    items: [
      CartItemModel(item: apple, quantity: 2),
      CartItemModel(item: grape, quantity: 3),
      CartItemModel(item: kiwi, quantity: 4),
    ],
    copyAndPast: "copyAndPast",
    createdDateTime: DateTime.parse(
      "2022-06-15 10:00:10.458",
    ),
    overdueDateTime: DateTime.parse(
      "2022-09-08 11:00:10.458",
    ),
    status: 'delivered',
    total: 0,
  ),
  OrderModel(
    orderId: "003",
    items: [
      CartItemModel(item: guava, quantity: 2),
      CartItemModel(item: onion, quantity: 3),
      CartItemModel(item: kiwi, quantity: 4),
    ],
    copyAndPast: "copyAndPast",
    createdDateTime: DateTime.parse(
      "2022-06-15 10:00:10.458",
    ),
    overdueDateTime: DateTime.parse(
      "2022-09-08 11:00:10.458",
    ),
    status: 'preparing_purchase',
    total: 0,
  ),
];
