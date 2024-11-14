class Productdetails {
  String image;
  String name;
  String price;
  String description;
  Productdetails({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });
}

final List<Productdetails> products = [
  Productdetails(
    name: 'Aesthetic Mug White',
    price: '\$19.99',
    image: "assets/productsImg/product-2.png",
    description:
        'The LG 22-inch monitor offers Full HD resolution and vibrant colors with IPS technology for sharp, clear visuals from any angle. Its sleek design, energy efficiency, and easy connectivity make it perfect for work and entertainment. Additional features like Reader Mode and Flicker Safe help reduce eye strain for comfortable use.',
  ),
  Productdetails(
    name: 'Audionic best quality airbuds',
    price: '\$50.00',
    image: "assets/productsImg/product-3.png",
    description:
        'This aesthetic mug boasts a delicate design in soft pastel hues, perfect for elevating your coffee experience. Its minimalist patterns add a touch of elegance, while the high-quality ceramic ensures durability. Sip in style and enjoy every moment!',
  ),
  Productdetails(
    name: 'PS5 Controller Black in color',
    price: '\$75.00',
    image: "assets/productsImg/product-4.png",
    description:
        'These sleek wireless earbuds deliver exceptional sound quality and a comfortable fit, making them perfect for music lovers on the go. With advanced noise cancellation and intuitive touch controls, they enhance your listening experience while keeping you connected. Their compact design and long battery life ensure you can enjoy your favorite tunes anywhere, anytime.',
  ),
  Productdetails(
    name: 'PS5 Controller Black in color',
    price: '\$75.00',
    image: "assets/productsImg/product-5.png",
    description:
        'This ergonomic game controller offers precision and comfort for an immersive gaming experience. With responsive buttons, customizable settings, and a sleek design, it enhances gameplay across various platforms. Its wireless connectivity and long-lasting battery ensure you stay in the action without interruptions.',
  ),
  Productdetails(
    name: 'Monitor LG 22 inches QLED',
    price: '\$199.99',
    image: "assets/productsImg/product-1.png",
    description:
        'This ergonomic game controller offers precision and comfort for an immersive gaming experience. With responsive buttons, customizable settings, and a sleek design, it enhances gameplay across various platforms. Its wireless connectivity and long-lasting battery ensure you stay in the action without interruptions.',
  ),
];
