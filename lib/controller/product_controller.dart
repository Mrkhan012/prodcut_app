import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodcut_app/model/product_model.dart';
import 'package:prodcut_app/repository/product_api.dart';
import 'package:prodcut_app/utils/color.dart';

class ProductController extends GetxController {
  final ProductService _productService = ProductService();

  var allProducts = <Product>[].obs;
  var displayedProducts = <Product>[].obs;
  var favoriteProducts = <Product>[].obs;
  var isLoading = false.obs;
  var hasMore = true.obs;
  var page = 0.obs;
  final int limit = 30;
  var searchQuery = "".obs;

  // Filters
  var selectedCategory = Rx<String?>(null);
  var minPrice = 0.0.obs;
  var maxPrice = 1000.0.obs;

  // Hint text management
  final List<String> hintTexts = [
    'Search for product...',
    'Search for category...',
    'Search for brand...',
  ];
  var currentHintIndex = 0.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    loadMoreProducts();
    startHintTextRotation();
  }

  void startHintTextRotation() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      currentHintIndex.value = (currentHintIndex.value + 1) % hintTexts.length;
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void toggleFavorite(Product product) {
    if (favoriteProducts.contains(product)) {
      favoriteProducts.remove(product);
      showSnackbar('${product.title} removed from favorites');
    } else {
      favoriteProducts.add(product);
      showSnackbar('${product.title} added to favorites');
    }
  }

  void showSnackbar(String message) {
    Get.snackbar(
      "Favorites",
      message,
      backgroundColor: kDefaultBlueColor,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
    );
  }

  Future<void> loadMoreProducts() async {
    if (isLoading.value || !hasMore.value) return;

    isLoading.value = true;

    try {
      final List<Product> products =
          await _productService.fetchProducts(page.value, limit);
      if (products.isEmpty) {
        hasMore.value = false;
      } else {
        allProducts.addAll(products);
        applyFilters();
        page.value++;
      }
    } catch (e) {
      print('Error loading products: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void applyFilters() {
    displayedProducts.clear();

    displayedProducts.addAll(allProducts.where((product) {
      final matchesCategory = selectedCategory.value == null ||
          selectedCategory.value == 'All' ||
          product.category?.name == selectedCategory.value;
      final matchesPrice = product.price != null &&
          product.price! >= minPrice.value &&
          product.price! <= maxPrice.value;
      final matchesSearch = searchQuery.value.isEmpty ||
          product.title!.toLowerCase().contains(searchQuery.value.toLowerCase());

      return matchesCategory && matchesPrice && matchesSearch;
    }));
  }

  void filterProducts(String query) {
    searchQuery.value = query;
    applyFilters();
  }

  List<String> getUniqueCategories() {
    final categories = allProducts
        .map((product) => product.category?.name ?? 'Unknown')
        .toSet()
        .toList();
    categories.insert(0, 'All'); // Add 'All' option to display all categories
    return categories;
  }
}
