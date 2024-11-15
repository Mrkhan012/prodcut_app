import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodcut_app/model/product_model.dart';
import 'package:prodcut_app/utils/color.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  void showSnackbar(String message) {
    Get.snackbar(
      "Favorites",
      message,
      backgroundColor: kDefaultBlueColor,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
    );
  }

  void addToCart(Product product) {
    showSnackbar('${product.title} added to favorites');

    cartItems.add(product);
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
  }
}
