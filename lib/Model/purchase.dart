import 'product.dart';

enum PurchaseStatus { success, pending, failed }

class Purchase {
  String id;
  Product product;
  String selectedSize;
  List<String> selectedToppings;
  int quantity;
  double totalPrice;
  DateTime purchaseDate;
  PurchaseStatus status;

  Purchase({
    required this.id,
    required this.product,
    required this.selectedSize,
    required this.selectedToppings,
    required this.quantity,
    required this.totalPrice,
    required this.purchaseDate,
    required this.status,
  });
}

final List<Purchase> purchaseHistory = [
  Purchase(
    id: 'trx001',
    product: productLists[0], // Caramel Latte
    selectedSize: 'M',
    selectedToppings: ['Extra Shot', 'Oat Milk'],
    quantity: 2,
    totalPrice: 28000.0 * 2 + 5000.0,
    purchaseDate: DateTime(2025, 6, 1, 14, 30),
    status: PurchaseStatus.success,
  ),
  Purchase(
    id: 'trx002',
    product: productLists[2], // Cold Brew Signature
    selectedSize: 'L',
    selectedToppings: ['Lemon Slice'],
    quantity: 1,
    totalPrice: 32000.0 + 3000.0,
    purchaseDate: DateTime(2025, 6, 5, 10, 0),
    status: PurchaseStatus.failed,
  ),
  Purchase(
    id: 'trx003',
    product: productLists[4], // V60 Manual Brew
    selectedSize: 'M',
    selectedToppings: [],
    quantity: 1,
    totalPrice: 35000.0,
    purchaseDate: DateTime(2025, 6, 10, 17, 45),
    status: PurchaseStatus.success,
  ),
  Purchase(
    id: 'trx001',
    product: productLists[0], // Caramel Latte
    selectedSize: 'M',
    selectedToppings: ['Extra Shot', 'Oat Milk'],
    quantity: 2,
    totalPrice: 28000.0 * 2 + 5000.0,
    purchaseDate: DateTime(2025, 6, 1, 14, 30),
    status: PurchaseStatus.success,
  ),
  Purchase(
    id: 'trx002',
    product: productLists[2], // Cold Brew Signature
    selectedSize: 'L',
    selectedToppings: ['Lemon Slice'],
    quantity: 1,
    totalPrice: 32000.0 + 3000.0,
    purchaseDate: DateTime(2025, 6, 5, 10, 0),
    status: PurchaseStatus.failed,
  ),
  Purchase(
    id: 'trx003',
    product: productLists[4], // V60 Manual Brew
    selectedSize: 'M',
    selectedToppings: [],
    quantity: 1,
    totalPrice: 35000.0,
    purchaseDate: DateTime(2025, 6, 10, 17, 45),
    status: PurchaseStatus.success,
  ),
  Purchase(
    id: 'trx001',
    product: productLists[0], // Caramel Latte
    selectedSize: 'M',
    selectedToppings: ['Extra Shot', 'Oat Milk'],
    quantity: 2,
    totalPrice: 28000.0 * 2 + 5000.0,
    purchaseDate: DateTime(2025, 6, 1, 14, 30),
    status: PurchaseStatus.success,
  ),
  Purchase(
    id: 'trx002',
    product: productLists[2], // Cold Brew Signature
    selectedSize: 'L',
    selectedToppings: ['Lemon Slice'],
    quantity: 1,
    totalPrice: 32000.0 + 3000.0,
    purchaseDate: DateTime(2025, 6, 5, 10, 0),
    status: PurchaseStatus.failed,
  ),
  Purchase(
    id: 'trx003',
    product: productLists[4], // V60 Manual Brew
    selectedSize: 'M',
    selectedToppings: [],
    quantity: 1,
    totalPrice: 35000.0,
    purchaseDate: DateTime(2025, 6, 10, 17, 45),
    status: PurchaseStatus.success,
  ),
];
