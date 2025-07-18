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
  List<Review> reviews;

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
    required this.reviews,
  });
}

class Review {
  String user;
  String comment;
  double rating;
  List<String> imagesSlider;

  Review({
    required this.user,
    required this.comment,
    required this.rating,
    required this.imagesSlider,
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
      'assets/images/caramel_latte.jpg',
      'assets/images/caramel_latte.jpg',
    ],
    price: 28000.0,
    rating: 4.8,
    like: 120.0,
    isAvailable: true,
    sizes: ['S', 'M', 'L'],
    toppings: ['Extra Shot', 'Whipped Cream', 'Oat Milk'],
    reviews: [
      Review(
        user: 'Arjun',
        comment: 'Kopi lumayan enak, tapi menurut saya agak terlalu manis.',
        rating: 5,
        imagesSlider: [
          'assets/images/caramel_latte.jpg',
          'assets/images/caramel_latte.jpg',
        ],
      ),
      Review(
        user: 'Pyari',
        comment:
            'Saya suka banget dengan rasa kopinya yang lembut dan tidak terlalu pahit. '
            'Selain itu, tempatnya nyaman dan cocok buat kerja atau nongkrong bareng teman. '
            'Recommended banget!',
        rating: 4.7,
        imagesSlider: ['assets/images/caramel_latte.jpg'],
      ),
    ],
  ),
  Product(
    id: '2',
    name: 'Espresso Single Shot',
    description:
        'Espresso klasik dengan rasa kuat dan pekat. Menggunakan 100% biji kopi Arabika terbaik.',
    category: 'Espresso',
    imageCover: 'assets/images/espresso.jpg',
    imagesSlider: ['assets/images/espresso.jpg', 'assets/images/espresso.jpg'],
    price: 18000.0,
    rating: 4.6,
    like: 80.0,
    isAvailable: true,
    sizes: ['S'],
    toppings: [],
    reviews: [
      Review(
        user: 'Rina',
        comment: 'Enak banget!',
        rating: 5.0,
        imagesSlider: [
          'assets/images/espresso.jpg',
          'assets/images/espresso.jpg',
        ],
      ),
      Review(
        user: 'Dimas',
        comment: 'Kopi lumayan enak, tapi menurut saya agak terlalu manis.',
        rating: 4.5,
        imagesSlider: [
          'assets/images/espresso.jpg',
          'assets/images/espresso.jpg',
        ],
      ),
      Review(
        user: 'Sari',
        comment:
            'Saya suka banget dengan rasa kopinya yang lembut dan tidak terlalu pahit. '
            'Selain itu, tempatnya nyaman dan cocok buat kerja atau nongkrong bareng teman. '
            'Recommended banget!',
        rating: 4.7,
        imagesSlider: [
          'assets/images/espresso.jpg',
          'assets/images/espresso.jpg',
        ],
      ),
    ],
  ),
  Product(
    id: '3',
    name: 'Cold Brew Signature',
    description:
        'Kopi seduh dingin yang disimpan selama 18 jam untuk rasa yang lebih halus dan rendah asam.',
    category: 'Milk-Based',
    imageCover: 'assets/images/cold_brew_signature.jpg',
    imagesSlider: [
      'assets/images/cold_brew_signature.jpg',
      'assets/images/cold_brew_signature.jpg',
    ],
    price: 32000.0,
    rating: 4.7,
    like: 95.0,
    isAvailable: true,
    sizes: ['M', 'L'],
    toppings: ['Lemon Slice', 'Brown Sugar'],
    reviews: [
      Review(
        user: 'Rina',
        comment: 'Enak banget!',
        rating: 5.0,
        imagesSlider: [
          'assets/images/cold_brew_signature.jpg',
          'assets/images/cold_brew_signature.jpg',
        ],
      ),
      Review(
        user: 'Dimas',
        comment: 'Kopi lumayan enak, tapi menurut saya agak terlalu manis.',
        rating: 4.5,
        imagesSlider: [
          'assets/images/cold_brew_signature.jpg',
          'assets/images/cold_brew_signature.jpg',
        ],
      ),
      Review(
        user: 'Sari',
        comment:
            'Saya suka banget dengan rasa kopinya yang lembut dan tidak terlalu pahit. '
            'Selain itu, tempatnya nyaman dan cocok buat kerja atau nongkrong bareng teman. '
            'Recommended banget!',
        rating: 4.7,
        imagesSlider: [
          'assets/images/cold_brew_signature.jpg',
          'assets/images/cold_brew_signature.jpg',
        ],
      ),
    ],
  ),
  Product(
    id: '4',
    name: 'Hazelnut Cappuccino',
    description:
        'Cappuccino creamy dengan sentuhan rasa hazelnut yang lembut dan aroma menggoda.',
    category: 'Milk-Based',
    imageCover: 'assets/images/hazlenut_latte.jpg',
    imagesSlider: [
      'assets/images/hazlenut_latte.jpg',
      'assets/images/hazlenut_latte.jpg',
    ],
    price: 30000.0,
    rating: 4.5,
    like: 70.0,
    isAvailable: false,
    sizes: ['S', 'M'],
    toppings: ['Cinnamon Powder', 'Oat Milk'],
    reviews: [
      Review(
        user: 'Rina',
        comment: 'Enak banget!',
        rating: 5.0,
        imagesSlider: [
          'assets/images/hazlenut_latte.jpg',
          'assets/images/hazlenut_latte.jpg',
        ],
      ),
      Review(
        user: 'Dimas',
        comment: 'Kopi lumayan enak, tapi menurut saya agak terlalu manis.',
        rating: 4.5,
        imagesSlider: [
          'assets/images/hazlenut_latte.jpg',
          'assets/images/hazlenut_latte.jpg',
        ],
      ),
      Review(
        user: 'Sari',
        comment:
            'Saya suka banget dengan rasa kopinya yang lembut dan tidak terlalu pahit. '
            'Selain itu, tempatnya nyaman dan cocok buat kerja atau nongkrong bareng teman. '
            'Recommended banget!',
        rating: 4.7,
        imagesSlider: [
          'assets/images/hazlenut_latte.jpg',
          'assets/images/hazlenut_latte.jpg',
        ],
      ),
    ],
  ),
  Product(
    id: '5',
    name: 'V60 Brew',
    description:
        'Seduhan manual menggunakan metode V60 dengan biji kopi pilihan dari Gayo, menawarkan rasa fruity dan clean finish.',
    category: 'Manual Brew',
    imageCover: 'assets/images/v60.jpg',
    imagesSlider: ['assets/images/v60.jpg', 'assets/images/v60.jpg'],
    price: 35000.0,
    rating: 4.9,
    like: 105.0,
    isAvailable: true,
    sizes: ['M'],
    toppings: [],
    reviews: [
      Review(
        user: 'Rina',
        comment: 'Enak banget!',
        rating: 5.0,
        imagesSlider: ['assets/images/v60.jpg', 'assets/images/v60.jpg'],
      ),
      Review(
        user: 'Dimas',
        comment: 'Kopi lumayan enak, tapi menurut saya agak terlalu manis.',
        rating: 4.5,
        imagesSlider: ['assets/images/v60.jpg', 'assets/images/v60.jpg'],
      ),
      Review(
        user: 'Sari',
        comment:
            'Saya suka banget dengan rasa kopinya yang lembut dan tidak terlalu pahit. '
            'Selain itu, tempatnya nyaman dan cocok buat kerja atau nongkrong bareng teman. '
            'Recommended banget!',
        rating: 4.7,
        imagesSlider: ['assets/images/v60.jpg', 'assets/images/v60.jpg'],
      ),
    ],
  ),
    Product(
    id: '6',
    name: 'kopi Susu',
    description:
        'Kopi susu dengan campuran susu segar dan gula aren, memberikan rasa manis yang pas.',
    category: 'Milk-Based',
    imageCover: 'assets/images/kopisusu.jpg',
    imagesSlider: ['assets/images/kopisusu.jpg', 'assets/images/kopisusu.jpg'],
    price: 25000.0,
    rating: 4.9,
    like: 105.0,
    isAvailable: true,
    sizes: ['M'],
    toppings: [],
    reviews: [
      Review(
        user: 'Rina',
        comment: 'Enak banget!',
        rating: 5.0,
        imagesSlider: ['assets/images/v60.jpg', 'assets/images/v60.jpg'],
      ),
      Review(
        user: 'Dimas',
        comment: 'Kopi lumayan enak, tapi menurut saya agak terlalu manis.',
        rating: 4.5,
        imagesSlider: ['assets/images/v60.jpg', 'assets/images/v60.jpg'],
      ),
      Review(
        user: 'Sari',
        comment:
            'Saya suka banget dengan rasa kopinya yang lembut dan tidak terlalu pahit. '
            'Selain itu, tempatnya nyaman dan cocok buat kerja atau nongkrong bareng teman. '
            'Recommended banget!',
        rating: 4.7,
        imagesSlider: ['assets/images/v60.jpg', 'assets/images/v60.jpg'],
      ),
    ],
  ),
];
