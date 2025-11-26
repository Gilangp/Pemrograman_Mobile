import '../models/pizza.dart';
import '../services/httphelper.dart';

class PizzaController {
  final HttpHelper _httpHelper = HttpHelper();

  Future<List<Pizza>> getPizzaList() async {
    try {
      List<Pizza> pizzas = await _httpHelper.getPizzaList();
      return pizzas;
    } catch (e) {
      rethrow;
    }
  }
}
