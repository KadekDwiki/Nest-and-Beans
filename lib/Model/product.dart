class Product {
  String id;
  String name;
  String description;
  String category;
  String imageCover;
  List<String> imagesSlider;
  double price;
  double rating;
  double like;
  bool isAvailable;
  List<String> sizes;
  List<String> toppings;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.imageCover,
    required this.imagesSlider,
    required this.price,
    required this.rating,
    required this.like,
    required this.isAvailable,
    required this.sizes,
    required this.toppings,
  });
}

final List<Product> productLists = [
  Product(
    id: '1',
    name: 'Caramel Latte',
    description:
        'Perpaduan sempurna antara espresso, susu hangat, dan sirup karamel yang manis. Cocok untuk penikmat kopi ringan.',
    category: 'Milk-Based',
    imageCover: 'assets/images/caramel_latte.jpg',
    imagesSlider: [
      'assets/images/caramel-latte-1.jpg',
      'assets/images/caramel-latte-2.jpg',
    ],
    price: 28000.0,
    rating: 4.8,
    like: 120.0,
    isAvailable: true,
    sizes: ['S', 'M', 'L'],
    toppings: ['Extra Shot', 'Whipped Cream', 'Oat Milk'],
  ),
  Product(
    id: '2',
    name: 'Espresso Single Shot',
    description:
        'Espresso klasik dengan rasa kuat dan pekat. Menggunakan 100% biji kopi Arabika terbaik.',
    category: 'Espresso',
    imageCover: 'assets/images/espresso.jpg',
    imagesSlider: [
      'assets/images/espresso-1.jpg',
      'assets/images/espresso-2.jpg',
    ],
    price: 18000.0,
    rating: 4.6,
    like: 80.0,
    isAvailable: true,
    sizes: ['S'],
    toppings: [],
  ),
  Product(
    id: '3',
    name: 'Cold Brew Signature',
    description:
        'Kopi seduh dingin yang disimpan selama 18 jam untuk rasa yang lebih halus dan rendah asam.',
    category: 'Cold Brew',
    imageCover: 'assets/images/cold_brew_signature.jpg',
    imagesSlider: [
      'assets/images/cold-brew-1.jpg',
      'assets/images/cold-brew-2.jpg',
    ],
    price: 32000.0,
    rating: 4.7,
    like: 95.0,
    isAvailable: true,
    sizes: ['M', 'L'],
    toppings: ['Lemon Slice', 'Brown Sugar'],
  ),
  Product(
    id: '4',
    name: 'Hazelnut Cappuccino',
    description:
        'Cappuccino creamy dengan sentuhan rasa hazelnut yang lembut dan aroma menggoda.',
    category: 'Milk-Based',
    imageCover: 'assets/images/hazlenut_latte.jpg',
    imagesSlider: [
      'assets/images/hazelnut-cappuccino-1.jpg',
      'assets/images/hazelnut-cappuccino-2.jpg',
    ],
    price: 30000.0,
    rating: 4.5,
    like: 70.0,
    isAvailable: false,
    sizes: ['S', 'M'],
    toppings: ['Cinnamon Powder', 'Oat Milk'],
  ),
  Product(
    id: '5',
    name: 'V60 Manual Brew',
    description:
        'Seduhan manual menggunakan metode V60 dengan biji kopi pilihan dari Gayo, menawarkan rasa fruity dan clean finish.',
    category: 'Manual Brew',
    imageCover: 'assets/images/v60.jpg',
    imagesSlider: ['assets/images/v60-1.jpg', 'assets/images/v60-2.jpg'],
    price: 35000.0,
    rating: 4.9,
    like: 105.0,
    isAvailable: true,
    sizes: ['M'],
    toppings: [],
  ),
];
