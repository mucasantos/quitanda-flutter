const String urlBase = 'https://parseapi.back4app.com';

abstract class Endpoints {
  static const String signIn = '$urlBase/login';
  static const String signUp = '$urlBase/users';
  static const String validateToken = '$urlBase/users/me';
  static const String resetPassword = '$urlBase/requestPasswordReset';
  static const String getCategories = '$urlBase/classes/allcategories';
  static const String getProducts = '$urlBase/classes/products';
}
