import 'package:ecommerce_app/Components/color_box.dart';
import 'package:ecommerce_app/Data/product_data.dart';
import 'package:ecommerce_app/Provider/cart_provider.dart';
import 'package:ecommerce_app/Routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  final Productdetails product;

  DetailsScreen({required this.product});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int itemcount = 0;

  // Function to add item to the cart
  void addToCart() {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addItem(widget.product); // Add product to cart
    setState(() {
      itemcount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Details'),
            IconButton(
              onPressed: () {
                // Navigate to the Cart screen
                Navigator.pushNamed(context, RouteName.cart);
              },
              icon: Badge(
                isLabelVisible: cartProvider.items.isNotEmpty,
                label: Text('${cartProvider.items.length}'),
                offset: const Offset(4, -8),
                backgroundColor: Colors.red,
                child: const Icon(Icons.shopping_cart_outlined, size: 22),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.product.image,
                height: size.height * 0.3,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.product.price,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Choose the color",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  const Row(
                    children: [
                      ColorBoxWidget(color: Colors.amber),
                      ColorBoxWidget(color: Colors.pinkAccent),
                      ColorBoxWidget(color: Colors.grey),
                      ColorBoxWidget(color: Colors.blueGrey),
                      ColorBoxWidget(color: Colors.black),
                    ],
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.apple,
                        size: 30,
                        color: Colors.grey[900],
                      ),
                    ),
                    title: Text(
                      " Apple Store",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Online 12 mins ago",
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      height: 40,
                      width: 100,
                      child: Center(
                          child: Text(
                        "Follow",
                        style: TextStyle(fontSize: 15),
                      )),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Description of product",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(widget.product.description,
                      style: const TextStyle(
                        fontSize: 15,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  // Add to Cart Button
                  Expanded(
                    child: GestureDetector(
                      onTap: addToCart,
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: const Color(0xff67C4A7),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Buy Now Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Add Buy Now functionality here
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Buy Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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
