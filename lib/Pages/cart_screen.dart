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
    final itemsInCart = cartProvider.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkouts"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery to"),
                Text("Salatiga City, Central Java"),
              ],
            ),
            const SizedBox(height: 10),
            // Check if there are items in the cart
            itemsInCart.isEmpty
                ? const Expanded(
                    child: Center(
                      child: Text(
                        "No items in the cart",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: itemsInCart.length,
                      itemBuilder: (context, index) {
                        final cartItem = itemsInCart[index];
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
                                  icon: const Icon(Icons.add),
                                  onPressed: () => _increaseQuantity(cartItem),
                                ),
                                Text(cartItem.quantity.toString()),
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () => _decreaseQuantity(cartItem),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () => _removeItem(cartItem),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            // Order Summary (Only show if there are items in the cart)
            if (itemsInCart.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total price (${itemsInCart.length} items)"),
                        Text("\$${totalPrice.toStringAsFixed(2)}"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        // Proceed to payment
                      },
                      child: const Text("Select payment method"),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
