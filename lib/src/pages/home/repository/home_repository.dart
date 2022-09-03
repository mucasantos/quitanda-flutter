import 'package:quitanda/src/constants/endpoints.dart';
import 'package:quitanda/src/models/category_model.dart';
import 'package:quitanda/src/models/item_model.dart';
import 'package:quitanda/src/services/http_manager.dart';

class HomeRepository {
  final HttpManager _httpManager = HttpManager();

  Future<List<CategoryModel>> getAllCategories() async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getCategories,
      method: HttptMethods.get,
    );

    List<CategoryModel> allCats = [];
    for (var element in (result['results'] as List<dynamic>)) {
      allCats.add(CategoryModel.fromMap(element));
    }
    return allCats;
  }

  Future<List<ItemModel>> getProducts() async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getProducts,
      method: HttptMethods.get,
    );

    List<ItemModel> allProducts = [];
    if (result['results'] != null) {
      for (var element in (result['results'] as List<dynamic>)) {
        allProducts.add(ItemModel.fromMap(element));
      }
      return allProducts;
    } else {
      return [];
    }
  }
}
