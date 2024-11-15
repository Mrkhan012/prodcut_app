import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodcut_app/controller/product_controller.dart';
import 'package:prodcut_app/model/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:prodcut_app/utils/color.dart';
import 'package:prodcut_app/view/conforamtion_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Default image URL
    const String defaultImageUrl =
        "https://imgbd.weyesimg.com/prod/moving/img/e5dddebf112df86531ffa4803608d724/366481e7aefbf9fe8a44850dcd5cfc20.jpg";

    // URL for the image or fallback to default if null or empty
    final String imageUrl = (product.category?.image?.isNotEmpty == true)
        ? product.category!.image![0]
        : defaultImageUrl;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kDefaultBlueColor,
        title: const Text(
          'Product Details',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                      imageUrl: imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Image.network(
                            defaultImageUrl,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          )),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      product.title ?? 'Product Title',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      product.description ?? 'Product Description',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Price: \$${product.price?.toStringAsFixed(2) ?? '0.00'}',
                      style: const TextStyle(fontSize: 20, color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _showBuyOptions(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kDefaultBlueColor,
                  padding: const EdgeInsets.all(16),
                ),
                child: const Text(
                  'Buy Now',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBuyOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Choose Payment Option',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.attach_money),
                title: const Text('Cash on Delivery'),
                onTap: () {
                  // Handle Cash on Delivery option
                  Get.to(() => const ConfirmationScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_balance_wallet),
                title: const Text('UPI'),
                onTap: () {
                  // Handle UPI option
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
