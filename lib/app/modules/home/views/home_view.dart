import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopingapp/app/data/model.dart';
import 'package:shopingapp/app/modules/cartscreen/views/cartscreen_view.dart';
import 'package:shopingapp/app/modules/home/views/card_ui.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(CartscreenView());
              },
              icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: FutureBuilder<List<RecipModel>>(
        future: controller.getingalldata(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final data = snapshot.data![index];
                return Widgetcard(data: data);
              },
            );
          }
        }),
      ),
    );
  }
}
