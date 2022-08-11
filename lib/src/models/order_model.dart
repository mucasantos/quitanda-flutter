import 'package:quitanda/src/models/cart_item_model.dart';
import 'package:quitanda/src/models/item_model.dart';

class OrderModel {
  String orderId;
  DateTime createdDateTime;
  DateTime overdueDateTime;
  List<CartItemModel> items;
  String status;
  String copyAndPast;
  double total;

  OrderModel({
    required this.orderId,
    required this.items,
    required this.copyAndPast,
    required this.createdDateTime,
    required this.overdueDateTime,
    required this.status,
    required this.total,
  });
}
