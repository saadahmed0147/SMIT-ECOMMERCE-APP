import 'package:ecommerce_app/Components/bottom_navbar.dart';
import 'package:ecommerce_app/Components/category_item.dart';
import 'package:ecommerce_app/Components/product_card.dart';
import 'package:ecommerce_app/Components/textfield.dart';
import 'package:ecommerce_app/Model/cart_model.dart';
import 'package:ecommerce_app/Provider/cart_provider.dart';
import 'package:ecommerce_app/Data/product_data.dart';
import 'package:ecommerce_app/Routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // Function to handle adding items to the cart
  void _addToCart(Productdetails product) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addItem(product);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery Address',
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
            Text(
              'Sukajaya City, Central Java',
              style: TextStyle(color: Colors.black, fontSize: 13),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteName.cart);
            },
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart_outlined),
                Consumer<CartProvider>(
                  builder: (context, cartProvider, child) {
                    if (cartProvider.items.isNotEmpty) {
                      return Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '${cartProvider.items.length}',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            SearchField(
              hint: "Search here...",
              inputType: TextInputType.text,
              prefixIcon: Icons.search,
              textEditingController: searchController,
            ),
            // Banner Section
            SizedBox(
              height: size.height * 0.25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) => Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: size.height * 0.2,
                        width: size.width - 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            image: AssetImage("assets/banner 1.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Categories Section
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                "Category",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoryItem(
                  imagePath: "assets/categoryImg/category1.png",
                  size: size,
                ),
                CategoryItem(
                  imagePath: "assets/categoryImg/category2.png",
                  size: size,
                ),
                CategoryItem(
                  imagePath: "assets/categoryImg/category3.png",
                  size: size,
                ),
                CategoryItem(
                  imagePath: "assets/categoryImg/category4.png",
                  size: size,
                ),
                CategoryItem(
                  imagePath: "assets/categoryImg/Group.png",
                  size: size,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            // Recent Products Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Recent Products",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.grey),
                    ),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Filters    ",
                            style: TextStyle(
                                fontFamily: 'poppinslight', fontSize: 12),
                          ),
                        ),
                        Icon(
                          Icons.filter_alt_outlined,
                          size: 12,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: products[index],
                    onAddToCart: _addToCart, // Add product to cart
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
