import 'package:get/get.dart';
import 'package:ecommerce_full/model/product_model.dart';

class CartItem {
  final ProductModel product;
  int quantity;
  CartItem({required this.product, this.quantity = 1});
}

class CartViewModel extends GetxController {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addProduct(ProductModel product) {
    final index = _cartItems.indexWhere((item) => item.product.name == product.name);
    if (index != -1) {
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(CartItem(product: product));
    }
    update();
  }

  void increaseQuantity(int index) {
    _cartItems[index].quantity++;
    update();
  }

  void decreaseQuantity(int index) {
    if (_cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
    } else {
      _cartItems.removeAt(index);
    }
    update();
  }

  double get total => _cartItems.fold(0, (sum, item) => sum + double.tryParse(item.product.price)!.toDouble() * item.quantity);
} 