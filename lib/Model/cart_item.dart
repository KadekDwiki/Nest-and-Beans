import 'product.dart';

class CartItem {
  final String id;
  final Product product;
  final String size;
  final List<String> toppings;
  int qty;

  CartItem({
    required this.id,
    required this.product,
    required this.size,
    required this.toppings,
    this.qty = 1,
  });

  double get linePrice => product.price * qty;
}
