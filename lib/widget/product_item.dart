import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:prodcut_app/controller/product_controller.dart';
import 'package:prodcut_app/model/product_model.dart';
import 'package:prodcut_app/utils/app_decoration.dart';
import 'package:prodcut_app/utils/theme.dart';
import 'package:prodcut_app/view/ProductDetailsScreen.dart';

Widget buildProductItem(BuildContext context, Product product) {
  final ProductController controller = Get.find<ProductController>();

  // Default image URL
  const String defaultImageUrl =
      "https://imgbd.weyesimg.com/prod/moving/img/e5dddebf112df86531ffa4803608d724/366481e7aefbf9fe8a44850dcd5cfc20.jpg";

  // URL for the image or fallback to default if null or empty
  final String imageUrl = product.category?.image?.isNotEmpty == true
      ? product.category!.image![0]
      : defaultImageUrl;

  // Check if the image URL is valid
  bool isImageUrlValid(String url) {
    Uri? uri = Uri.tryParse(url);
    return uri != null && uri.isAbsolute && uri.hasAuthority;
  }

  return Card(
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    child: Container(
      decoration: AppDecoration.outlineGrayA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsScreen(product: product)));
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        isImageUrlValid(imageUrl) ? imageUrl : defaultImageUrl,
                    height: Get.height * 0.3,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => const Center(
                      child: SpinKitCircle(
                        color: Color(0xFF6D31ED),
                        size: 50.0,
                      ),
                    ),
                    errorWidget: (context, url, error) {
                      print('Error loading image: $error');
                      return Image.network(
                        defaultImageUrl,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: 10.0,
                right: 10.0,
                child: Obx(() {
                  final isFavorite =
                      controller.favoriteProducts.contains(product);
                  return IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.white,
                    ),
                    onPressed: () => controller.toggleFavorite(product),
                  );
                }),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.title ?? 'No Title',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: Get.width * 0.045,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Price: \$${product.price?.toStringAsFixed(2) ?? '0.00'}',
              style: theme.textTheme.labelMedium?.copyWith(
                fontSize: Get.width * 0.045,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(
              product.description ?? 'No Description',
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: Get.width * 0.045,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              children: [
                const Icon(Icons.category, color: Colors.grey),
                const SizedBox(width: 4.0),
                Text(
                  product.category?.name ?? 'No Category',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: Get.width * 0.045,
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
