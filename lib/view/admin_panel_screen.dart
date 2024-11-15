import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodcut_app/controller/product_controller.dart';
import 'package:prodcut_app/model/product_model.dart';
import 'package:prodcut_app/utils/color.dart';
import 'package:prodcut_app/utils/theme.dart';

class AddEditProductScreen extends StatelessWidget {
  final ProductController controller = Get.find<ProductController>();
  final Product? product;

  AddEditProductScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: product?.title);
    final priceController =
        TextEditingController(text: product?.price?.toString());
    final descriptionController =
        TextEditingController(text: product?.description);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDefaultBlueColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          product == null ? 'Add Product' : 'Edit Product',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: Get.width * 0.044,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Product Title'),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text;
                final price =
                    int.tryParse(priceController.text) ?? 0; // Parse as int
                final description = descriptionController.text;

                if (product == null) {
                  controller.addProduct(
                    Product(
                        title: title, price: price, description: description),
                  );
                } else {
                  controller.updateProduct(
                    product!.id!,
                    title: title,
                    price: price,
                    description: description,
                  );
                }
                Get.back();
              },
              child: Text(product == null ? 'Add Product' : 'Update Product'),
            ),
          ],
        ),
      ),
    );
  }
}
