import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quitanda/src/models/category_model.dart';
import 'package:quitanda/src/models/item_model.dart';
import 'package:quitanda/src/pages/home/repository/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository = HomeRepository();

  bool isLoading = false;
  List<CategoryModel> allCategories = [];
  List<ItemModel> allProducts = [];
  CategoryModel? currentCategory;

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();

    fetchCategories();
    fetchProducts();
  }

  Future<void> fetchCategories() async {
    setLoading(true);
    List<CategoryModel> categsFromServer =
        await _homeRepository.getAllCategories();

    allCategories.addAll(categsFromServer);
    selectCategory(allCategories.first);
    setLoading(false);
  }

  Future<void> fetchProducts() async {
    setLoading(true);
    List<ItemModel> productsFromServer = await _homeRepository.getProducts();

    allProducts.addAll(productsFromServer);

    // allProducts.forEach(((element) => print(element.itemName)));
    setLoading(false);
    update();
  }

  void selectCategory(CategoryModel category) {
    currentCategory = category;
    update();

    fetchProducts();
  }
}
