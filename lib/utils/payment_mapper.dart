import '../model/purchase.dart';
import '../providers/cart_provider.dart';

class PurchasePaymentMapper {
  static PaymentMethod fromAppPayment(AppPaymentMethod appPayment) {
    switch (appPayment) {
      case AppPaymentMethod.qris:
        return PaymentMethod.qris;
      case AppPaymentMethod.ovo:
        return PaymentMethod.ovo;
      case AppPaymentMethod.dana:
        return PaymentMethod.dana;
      default:
        return PaymentMethod.qris; // fallback
    }
  }
}

class PaymentMapper {
  static String toLabel(AppPaymentMethod method) {
    switch (method) {
      case AppPaymentMethod.qris:
        return 'QRIS';
      case AppPaymentMethod.ovo:
        return 'OVO';
      case AppPaymentMethod.dana:
        return 'Dana';
      case AppPaymentMethod.shopeepay:
        return 'ShopeePay';
      case AppPaymentMethod.cash:
        return 'Cash';
    }
  }

  static AppPaymentMethod fromString(String name) {
    switch (name) {
      case 'QRIS':
        return AppPaymentMethod.qris;
      case 'OVO':
        return AppPaymentMethod.ovo;
      case 'Dana':
        return AppPaymentMethod.dana;
      case 'ShopeePay':
        return AppPaymentMethod.shopeepay;
      case 'Cash':
        return AppPaymentMethod.cash;
      default:
        return AppPaymentMethod.qris;
    }
  }
}
