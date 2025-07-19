import 'package:flutter/foundation.dart';
import '../model/cart_item.dart';

enum AppPaymentMethod { qris, ovo, dana, shopeepay, cash }

class AppVoucher {
  final String code;
  final double discountAmount;
  AppVoucher({required this.code, required this.discountAmount});
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];
  AppPaymentMethod? _payment;
  AppVoucher? _voucher;

  List<CartItem> get items => List.unmodifiable(_items);
  AppPaymentMethod? get payment => _payment;
  AppVoucher? get voucher => _voucher;

  // Tambah item: kalau produk + size + toppings sama -> update qty
  void addItem(CartItem newItem) {
    final idx = _items.indexWhere(
      (i) =>
          i.product.id == newItem.product.id &&
          i.size == newItem.size &&
          _listEquals(i.toppings, newItem.toppings),
    );
    if (idx >= 0) {
      _items[idx].qty += newItem.qty;
    } else {
      _items.add(newItem);
    }
    notifyListeners();
  }

  void updateQty(CartItem item, int newQty) {
    final idx = _items.indexOf(item);
    if (idx == -1) return;
    if (newQty <= 0) {
      _items.removeAt(idx);
    } else {
      _items[idx].qty = newQty;
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    _payment = null;
    _voucher = null;
    notifyListeners();
  }

  // Payment
  void selectPayment(AppPaymentMethod method) {
    _payment = method;
    notifyListeners();
  }

  // Voucher (versi sederhana: langsung assign nominal diskon)
  void applyVoucher(AppVoucher voucher) {
    _voucher = voucher;
    notifyListeners();
  }

  void removeVoucher() {
    _voucher = null;
    notifyListeners();
  }

  // Total
  double get subtotal => _items.fold(0, (sum, i) => sum + i.linePrice);

  double get discount => _voucher?.discountAmount ?? 0;
  double get serviceFee => 3000;
  double get packagingFee => 7000;
  double get total => ((subtotal - discount) + (serviceFee + packagingFee))
      .clamp(0, double.infinity);

  bool _listEquals(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (final e in a) {
      if (!b.contains(e)) return false;
    }
    return true;
  }
}
