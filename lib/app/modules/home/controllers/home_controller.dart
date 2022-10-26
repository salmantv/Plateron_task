import 'package:get/get.dart';
import 'package:shopingapp/app/data/model.dart';

class HomeController extends GetxController {
  List<RecipModel> alldata = [
    RecipModel(name: "Food", price: 12),
    RecipModel(name: "last Food", price: 18),
    RecipModel(name: " night food", price: 13),
    RecipModel(name: "break fast", price: 14),
  ];

  List<RecipModel> cartdata = [];
  Rx<int> totelamount = Rx(0);

  Future<List<RecipModel>> getingalldata() async {
    return alldata;
  }

  void countincriment(RecipModel data) {
    if (cartdata.contains(data)) {
      data.count = data.count + 1;
      update();
    } else {
      data.count = data.count + 1;
      cartdata.add(data);
    }
    update();
  }

  void countdeicriment(RecipModel data) {
    if (cartdata.contains(data)) {
      data.count = data.count - 1;

      if (data.count == 0) {
        cartdata.remove(data);
        getingtotelamount();
      }
    } else if (data.count < 1) {
      data.count = 0;
    } else {
      data.count = data.count - 1;
    }
    update();
  }

  void getingtotelamount() async {
    totelamount.value = 0;
    for (var i = 0; i < cartdata.length; i++) {
      totelamount.value += cartdata[i].price;
    }
    update();
  }
}
