import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:prodcut_app/controller/product_controller.dart';
import 'package:prodcut_app/model/product_model.dart';
import 'package:prodcut_app/utils/theme.dart';
import 'package:prodcut_app/widget/filter_widget.dart';
import 'package:prodcut_app/widget/product_item.dart';
import '../utils/color.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: kDefaultBlueColor,
        title: Text(
          'Products',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: Get.width * 0.044,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.filter_list,
              color: kAppBrightWhiteColor,
            ),
            onPressed: () => openFilterSheet(context, Product()),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Obx(() => TextField(
                    decoration: InputDecoration(
                      hintText: controller
                          .hintTexts[controller.currentHintIndex.value],
                      border: InputBorder.none,
                    ),
                    onChanged: (value) => controller.filterProducts(value),
                  )),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.displayedProducts.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/product.jpg', // Make sure this image exists in your assets
                  width: 300,
                  height: 300,
                ),
                const SizedBox(height: 20),
                const Text(
                  'No products found',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (scrollInfo is ScrollUpdateNotification &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              if (!controller.isLoading.value && controller.hasMore.value) {
                controller.loadMoreProducts();
              }
            }
            return false;
          },
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            itemCount: controller.displayedProducts.length +
                (controller.hasMore.value ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < controller.displayedProducts.length) {
                final product = controller.displayedProducts[index];
                return buildProductItem(context, product);
              } else {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: SpinKitWave(
                      color: kDefaultBlueColor,
                      size: 30.0,
                    ),
                  ),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
