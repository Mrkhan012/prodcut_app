// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:prodcut_app/controller/product_controller.dart';
// import 'package:prodcut_app/model/product_model.dart';

// class AddEditProductScreen extends StatelessWidget {
//   final ProductController controller = Get.find<ProductController>();
//   final Product? product; // Pass product if editing

//   AddEditProductScreen({this.product});

//   @override
//   Widget build(BuildContext context) {
//     final titleController = TextEditingController(text: product?.title);
//     final priceController = TextEditingController(text: product?.price?.toString());

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(product == null ? 'Add Product' : 'Edit Product'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: titleController,
//               decoration: InputDecoration(labelText: 'Product Title'),
//             ),
//             TextField(
//               controller: priceController,
//               decoration: InputDecoration(labelText: 'Price'),
//               keyboardType: TextInputType.number,
//             ),
//             TextField(
//               maxLines: 3,
//               decoration: InputDecoration(labelText: 'Description'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (product == null) {
//                   controller.addProduct(
//                     title: titleController.text,
//                     price: int.parse(priceController.text),
//                   );
//                 } else {
//                   controller.updateProduct(product!.id, titleController.text,
//                       int.parse(priceController.text));
//                 }
//                 Get.back();
//               },
//               child: Text(product == null ? 'Add Product' : 'Update Product'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
