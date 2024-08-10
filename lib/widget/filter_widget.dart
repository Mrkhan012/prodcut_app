import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodcut_app/controller/product_controller.dart';
import 'package:prodcut_app/model/product_model.dart';
import 'package:prodcut_app/utils/color.dart';
import 'package:prodcut_app/utils/theme.dart';
Future<dynamic> openFilterSheet(BuildContext context, Product product) {
  final ProductController controller = Get.find<ProductController>();

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Category',
                    labelStyle: const TextStyle(color: Colors.black87),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12.0),
                  ),
                  value: controller.selectedCategory.value,
                  items: controller.getUniqueCategories().map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category, style: const TextStyle(color: Colors.black87)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.selectedCategory.value = value;
                    controller.applyFilters();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Min Price',
                        labelStyle: const TextStyle(color: Colors.black87),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12.0),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue: controller.minPrice.value.toString(),
                      onChanged: (value) {
                        controller.minPrice.value = double.tryParse(value) ?? 0;
                        controller.applyFilters();
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Max Price',
                        labelStyle: const TextStyle(color: Colors.black87),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue: controller.maxPrice.value.toString(),
                      onChanged: (value) {
                        controller.maxPrice.value =
                            double.tryParse(value) ?? 1000;
                        controller.applyFilters();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Obx(() {
                        return Text(
                          'Price Range: \$${controller.minPrice.value.round()} - \$${controller.maxPrice.value.round()}',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontSize: Get.width * 0.040,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kDefaultBlueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16),
                ),
                onPressed: () {
                  controller.applyFilters();
                  Navigator.pop(context);
                },
                child: Text(
                  'Apply Filters',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: Get.width * 0.045,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
