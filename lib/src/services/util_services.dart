import 'package:intl/intl.dart';

class UtilServices {
  // R$ valor

  static String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BB');

    return numberFormat.format(price);
  }
}
