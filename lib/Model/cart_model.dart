import 'package:ecommerce_app/Data/product_data.dart';

class CartItem {
  final Productdetails product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}
