import 'product.dart';

enum PurchaseStatus { berhasil, pending, gagal }

enum PaymentMethod { qris, ovo, dana }

class Purchase {
  String id;
  Product product;
  String selectedSize;
  int quantity;
  List<String> toppings;
  double totalPrice;
  PaymentMethod paymentMethod;
  DateTime purchaseDate;
  PurchaseStatus status;
  String location;

  Purchase({
    required this.id,
    required this.product,
    required this.selectedSize,
    required this.quantity,
    required this.toppings,
    required this.totalPrice,
    required this.paymentMethod,
    required this.purchaseDate,
    required this.status,
    required this.location,
  });
}

final List<Purchase> purchaseHistory = [
  Purchase(
    id: 'trx001',
    product: productLists[0],
    selectedSize: 'M',
    quantity: 2,
    toppings: ['Extra Shot', 'Whipped Cream', 'Oat Milk'],
    totalPrice: 28000.0 * 2,
    paymentMethod: PaymentMethod.ovo,
    purchaseDate: DateTime(2025, 6, 1, 14, 30),
    status: PurchaseStatus.berhasil,
    location: 'Denpasar, Bali',
  ),
  Purchase(
    id: 'trx002',
    product: productLists[2],
    selectedSize: 'L',
    quantity: 1,
    toppings: ['Lemon Slice', 'Brown Sugar'],
    totalPrice: 32000.0,
    paymentMethod: PaymentMethod.ovo,
    purchaseDate: DateTime(2025, 6, 5, 10, 0),
    status: PurchaseStatus.gagal,
    location: 'Ubud, Bali',
  ),
  Purchase(
    id: 'trx003',
    product: productLists[3],
    selectedSize: 'M',
    quantity: 3,
    toppings: ['Oat Milk'],
    totalPrice: 30000.0,
    paymentMethod: PaymentMethod.ovo,
    purchaseDate: DateTime(2025, 6, 10, 17, 45),
    status: PurchaseStatus.pending,
    location: 'Canggu, Bali',
  ),
  Purchase(
    id: 'trx004',
    product: productLists[0],
    selectedSize: 'L',
    quantity: 2,
    toppings: ['Extra Shot', 'Whipped Cream', 'Oat Milk'],
    totalPrice: 28000.0 * 2,
    paymentMethod: PaymentMethod.ovo,
    purchaseDate: DateTime(2025, 6, 1, 14, 30),
    status: PurchaseStatus.berhasil,
    location: 'Denpasar, Bali',
  ),
  Purchase(
    id: 'trx005',
    product: productLists[2],
    selectedSize: 'L',
    quantity: 1,
    toppings: ['Lemon Slice', 'Brown Sugar'],
    totalPrice: 32000.0,
    paymentMethod: PaymentMethod.ovo,
    purchaseDate: DateTime(2025, 6, 5, 10, 0),
    status: PurchaseStatus.gagal,
    location: 'Ubud, Bali',
  ),
  Purchase(
    id: 'trx006',
    product: productLists[3],
    selectedSize: 'M',
    quantity: 1,
    toppings: ['Oat Milk'],
    totalPrice: 30000.0,
    paymentMethod: PaymentMethod.ovo,
    purchaseDate: DateTime(2025, 6, 10, 17, 45),
    status: PurchaseStatus.pending,
    location: 'Canggu, Bali',
  ),
  Purchase(
    id: 'trx007',
    product: productLists[0],
    selectedSize: 'M',
    quantity: 2,
    toppings: ['Extra Shot', 'Whipped Cream', 'Oat Milk'],
    totalPrice: 28000.0 * 2,
    paymentMethod: PaymentMethod.ovo,
    purchaseDate: DateTime(2025, 6, 1, 14, 30),
    status: PurchaseStatus.berhasil,
    location: 'Denpasar, Bali',
  ),
  Purchase(
    id: 'trx008',
    product: productLists[2],
    selectedSize: 'L',
    quantity: 1,
    toppings: ['Lemon Slice', 'Brown Sugar'],
    totalPrice: 32000.0,
    paymentMethod: PaymentMethod.ovo,
    purchaseDate: DateTime(2025, 6, 5, 10, 0),
    status: PurchaseStatus.gagal,
    location: 'Ubud, Bali',
  ),
  Purchase(
    id: 'trx009',
    product: productLists[3],
    selectedSize: 'M',
    quantity: 1,
    toppings: ['Oat Milk'],
    totalPrice: 30000.0,
    paymentMethod: PaymentMethod.ovo,
    purchaseDate: DateTime(2025, 6, 10, 17, 45),
    status: PurchaseStatus.pending,
    location: 'Canggu, Bali',
  ),
];
