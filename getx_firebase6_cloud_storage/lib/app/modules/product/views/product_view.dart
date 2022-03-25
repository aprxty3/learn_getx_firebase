import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.nameC,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Product Name",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.priceC,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: "Product Price",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.addProduct(
                  controller.nameC.text, controller.priceC.text),
              child: Text(
                'Tambah Product',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
