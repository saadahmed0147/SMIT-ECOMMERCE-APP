import 'package:ecommerce_app/Data/product_data.dart';
import 'package:ecommerce_app/Provider/cart_provider.dart';
import 'package:ecommerce_app/Routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Productdetails product;
  final Function(Productdetails) onAddToCart;

  const ProductCard(
      {super.key, required this.product, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SizedBox(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            RouteName.details,
            arguments: product,
          );
        },
        child: Card(
          color: const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: mq.height * 0.13,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(product.image), fit: BoxFit.fill),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, top: 10),
                child: Text(
                  product.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  product.price,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addItem(product);

                    onAddToCart(product); // Add product to cart when tapped
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13, vertical: 10),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xff67C4A7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Add to cart",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
