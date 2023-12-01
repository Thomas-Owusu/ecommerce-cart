import 'package:ecommerce_full/core/service/home_services.dart';
import 'package:ecommerce_full/model/category_model.dart';
import 'package:ecommerce_full/model/product_model.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  var loading = false.obs;
  var categoryModel = <CategoryModel>[].obs;
  var productModel = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCategory();
    getBestSellingProducts();
  }

  void getCategory() async {
    try {
      loading.value = true;
      var value = await HomeService().getCategory();
      categoryModel.value = value.map((e) => CategoryModel.fromJson(e.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      print(e);
    } finally {
      loading.value = false;
    }
  }

  void getBestSellingProducts() async {
    try {
      loading.value = true;
      var value = await HomeService().getBestSelling();
      productModel.value = value.map((e) => ProductModel.fromJson(e.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      print(e);
    } finally {
      loading.value = false;
    }
  }
}
