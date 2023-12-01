import 'package:ecommerce_full/constance.dart';
import 'package:ecommerce_full/core/view_model/home_view_model.dart';
import 'package:ecommerce_full/view/daetilas_view.dart';
import 'package:ecommerce_full/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final HomeViewModel controller = Get.find<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Column(
              children: [
                _searchTextFormField(),
                const SizedBox(height: 30),
                const CustomText(text: "Categories", maxLine: 2),
                const SizedBox(height: 30),
                _listViewCategory(),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomText(text: "Best Selling", fontSize: 18, maxLine: 2),
                    CustomText(text: "See all", fontSize: 16, maxLine: 2),
                  ],
                ),
                const SizedBox(height: 30),
                _listViewProducts(),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child:  TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.black),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return Obx(() {
      if (controller.categoryModel.isEmpty) {
        return const Center(child: Text('No categories found.'));
      }
      return SizedBox(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoryModel.length,
          separatorBuilder: (_, __) => const SizedBox(width: 20),
          itemBuilder: (context, index) {
            final image = controller.categoryModel[index].image;
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: (image != null && image.isNotEmpty)
                        ? Image.network(image, errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image))
                        : const Icon(Icons.broken_image),
                  ),
                ),
                const SizedBox(height: 20),
                CustomText(text: controller.categoryModel[index].name, maxLine: 2),
              ],
            );
          },
        ),
      );
    });
  }

  Widget _listViewProducts() {
    return Obx(() {
      if (controller.productModel.isEmpty) {
        return const Center(child: Text('No products found.'));
      }
      return SizedBox(
        height: 350,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.productModel.length,
          separatorBuilder: (_, __) => const SizedBox(width: 20),
          itemBuilder: (context, index) {
            final product = controller.productModel[index];
            final image = product.image;
            return GestureDetector(
              onTap: () {
                Get.to(() => DetailsView(model: product));
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      child: SizedBox(
                        height: 220,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: (image != null && image.isNotEmpty)
                            ? Image.network(image, fit: BoxFit.fill, errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image))
                            : const Icon(Icons.broken_image),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomText(text: product.name, alignment: Alignment.bottomLeft, maxLine: 2),
                    const SizedBox(height: 10),
                    Expanded(
                      child: CustomText(
                        text: product.description,
                        color: Colors.grey,
                        alignment: Alignment.bottomLeft,
                        maxLine: 2,
                      ),
                    ),
                    const SizedBox(height: 5),
                    CustomText(
                      text: "R${product.price}",
                      color: primaryColor,
                      alignment: Alignment.bottomLeft,
                      maxLine: 1,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
