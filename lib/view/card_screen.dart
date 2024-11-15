import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodcut_app/controller/card_controller.dart';
import 'package:prodcut_app/model/product_model.dart';
import 'package:prodcut_app/utils/color.dart';
import 'package:prodcut_app/utils/theme.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: Get.width * 0.044,
          ),
        ),
        backgroundColor: kDefaultBlueColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return const Center(child: Text('No items in your cart.'));
        }

        return ListView.builder(
          itemCount: cartController.cartItems.length,
          itemBuilder: (context, index) {
            final product = cartController.cartItems[index];

            // URL for the image or fallback to default if null or empty
            final String imageUrl = product.category?.image?.isNotEmpty == true
                ? product.category!.image![0]
                : "https://imgbd.weyesimg.com/prod/moving/img/e5dddebf112df86531ffa4803608d724/366481e7aefbf9fe8a44850dcd5cfc20.jpg";

            return Dismissible(
              key: Key(product.id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (_) {
                cartController.removeFromCart(product);
              },
              background: Container(
                color: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerRight,
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              child: ListTile(
                leading: Image.network(
                  imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.network(
                    "https://imgbd.weyesimg.com/prod/moving/img/e5dddebf112df86531ffa4803608d724/366481e7aefbf9fe8a44850dcd5cfc20.jpg",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(product.title ?? 'No Title'),
                subtitle: Text(
                    'Price: \$${product.price?.toStringAsFixed(2) ?? '0.00'}'),
              ),
            );
          },
        );
      }),
    );
  }
}
