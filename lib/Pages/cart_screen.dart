import 'package:ecommerce_app/Model/cart_model.dart';
import 'package:ecommerce_app/Provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double get totalPrice => context.read<CartProvider>().items.fold(
      0,
      (sum, item) =>
          sum +
          (double.parse(item.product.price.substring(1)) * item.quantity));

  void _increaseQuantity(CartItem item) {
    setState(() {
      item.quantity++;
    });
  }

  void _decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      setState(() {
        item.quantity--;
      });
    }
  }

  void _removeItem(CartItem item) {
    setState(() {
      context.read<CartProvider>().removeItem(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Checkouts"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Delivery and Location
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery to"),
                Text("Salatiga City, Central Java"),
              ],
            ),
            SizedBox(height: 10),
            // Cart Items List
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.items.length,
                itemBuilder: (context, index) {
                  final cartItem = cartProvider.items[index];
                  return Card(
                    child: ListTile(
                      leading: Image.asset(cartItem.product.image,
                          width: 50, height: 50),
                      title: Text(cartItem.product.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cartItem.product.price),
                          // Text("Variant: ${cartItem.product.description}"),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize
                            .min, // Ensure it doesn't take more space than needed
                        children: [
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () => _increaseQuantity(cartItem),
                          ),
                          Text(cartItem.quantity.toString()),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () => _decreaseQuantity(cartItem),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _removeItem(cartItem),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Order Summary
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total price (${cartProvider.items.length} items)"),
                      Text("\$${totalPrice.toStringAsFixed(2)}"),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      // Proceed to payment
                    },
                    child: Text("Select payment method"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
