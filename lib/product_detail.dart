import 'package:flutter/material.dart';
import 'package:nest_and_beans/model/product.dart';
import 'package:nest_and_beans/order_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:nest_and_beans/model/cart_item.dart';
import 'package:nest_and_beans/providers/cart_provider.dart';
import 'package:audioplayers/audioplayers.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  String? selectedSize;
  int quantity = 1;
  List<String> selectedToppings = [];

  late final AudioPlayer _audioPlayer;
  bool isMuted = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playAudio();
  }

  Future<void> _playAudio() async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.play(
      AssetSource('audio/lofi-girl-lofi-hiphop-beats-328177.mp3'),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final double totalPrice = product.price * quantity;
    final colorscheme = Theme.of(context).colorScheme;

    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Produk',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: colorscheme.primary,
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: isWideScreen
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        product.imageCover,
                        height: 400,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(flex: 2, child: _buildProductDetailContent(product)),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        product.imageCover,
                        height: 440,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildProductDetailContent(product),
                ],
              ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.shade300)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                  ),
                  Text('$quantity', style: const TextStyle(fontSize: 16)),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                  ),
                ],
              ),
              ElevatedButton(
                // onPressed: selectedSize == null || !product.isAvailable
                //     ? null
                //     : () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(builder: (context) => OrderPage()),
                //         );
                //       },

                // membuat data orderan dinamis || dwiki
                onPressed: selectedSize == null || !product.isAvailable
                    ? null
                    : () async {
                        await _audioPlayer.stop();
                        final cart = context.read<CartProvider>();

                        final item = CartItem(
                          id: '${product.id}_${selectedSize}_${selectedToppings.join(",")}', // sederhana
                          product: product,
                          size: selectedSize!,
                          toppings: List.from(selectedToppings),
                          qty: quantity,
                        );

                        cart.addItem(item);

                        // langsung ke checkout?
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OrderPage()),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorscheme.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 12,
                  ),
                ),
                child: Text(
                  'Tambah - Rp ${totalPrice.toStringAsFixed(0)}',
                  style: const TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductDetailContent(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: product.imagesSlider.map((imagePath) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(imagePath),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          product.name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(product.description, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 12),
        Text(
          'Rp ${product.price.toStringAsFixed(0)}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const Divider(height: 10, color: Colors.grey),
        const SizedBox(height: 20),

        const SizedBox(height: 20),

        const Text(
          'Pilih Ukuran Cup:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 20,
          children: product.sizes.map((size) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<String>(
                  value: size,
                  groupValue: selectedSize,
                  onChanged: (value) {
                    setState(() {
                      selectedSize = value!;
                    });
                  },
                ),
                Text(size),
              ],
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        const Divider(height: 10, color: Colors.grey),
        const SizedBox(height: 20),
        const Text(
          'Pilih Topping:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Column(
          children: product.toppings.map((topping) {
            return CheckboxListTile(
              title: Text(topping),
              value: selectedToppings.contains(topping),
              onChanged: (bool? isChecked) {
                setState(() {
                  if (isChecked == true) {
                    selectedToppings.add(topping);
                  } else {
                    selectedToppings.remove(topping);
                  }
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        const Divider(height: 10, color: Colors.grey),
        const SizedBox(height: 20),

        // Review and Rating Section
        const Text(
          'Ulasan Produk',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: product.reviews.length,
          itemBuilder: (context, index) {
            final review = product.reviews[index];

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar and Username
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            child: Icon(Icons.person, color: Colors.white),
                            backgroundColor: Colors.grey,
                          ),
                          SizedBox(width: 8),
                          Text(
                            review.user,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: review.rating,
                            itemBuilder: (context, _) =>
                                const Icon(Icons.star, color: Colors.amber),
                            itemCount: 5,
                            itemSize: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '${review.rating}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Rating
                  const SizedBox(height: 8),

                  // Review Comment
                  Text(review.comment),
                  const SizedBox(height: 8),

                  // Gambar review
                  if (review.imagesSlider.isNotEmpty)
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: review.imagesSlider.map((imgPath) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            imgPath,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        );
                      }).toList(),
                    ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
