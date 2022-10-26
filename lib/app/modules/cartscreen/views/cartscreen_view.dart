import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shopingapp/app/modules/home/controllers/home_controller.dart';
import 'package:shopingapp/app/modules/home/views/card_ui.dart';

import '../controllers/cartscreen_controller.dart';

class CartscreenView extends GetView<CartscreenController> {
  final home = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    home.getingtotelamount();
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: SizedBox(
          height: 60,
          width: double.infinity,
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: GetBuilder<HomeController>(builder: (context) {
                return Text(
                  "Total amount ${home.totelamount.value}.0",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                );
              }),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        builder: (context) {
          return ListView.builder(
            itemCount: home.cartdata.length,
            itemBuilder: (context, index) {
              final data = home.cartdata[index];
              return Widgetcard(data: data);
            },
          );
        },
      ),
    );
  }
}
