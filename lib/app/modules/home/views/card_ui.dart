import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopingapp/app/data/model.dart';
import 'package:shopingapp/app/modules/home/controllers/home_controller.dart';

class Widgetcard extends StatelessWidget {
  final homecontroller = Get.put(HomeController());

  Widgetcard({Key? key, required this.data}) : super(key: key);

  RecipModel data;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (context) {
      return Container(
        width: double.infinity,
        height: 180,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 140,
                    width: 120,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://www.acouplecooks.com/wp-content/uploads/2020/12/Honey-Garlic-Shrimp-026.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  height: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.name),
                      Text(
                          "Fresh cut heart of rmaine letturce \ntossed with our casar"),
                      Row(
                        children: [
                          Text("${data.price}.0"),
                          SizedBox(
                            width: 70,
                          ),
                          Container(
                            height: 33,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      homecontroller.countdeicriment(data),
                                  child: Icon(
                                    Icons.remove,
                                    size: 18,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(data.count.toString()),
                                GestureDetector(
                                  onTap: () {
                                    homecontroller.countincriment(data);
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 18,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
