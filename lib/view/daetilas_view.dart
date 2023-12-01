import 'package:ecommerce_full/constance.dart';
import 'package:ecommerce_full/model/product_model.dart';
import 'package:ecommerce_full/view/widgets/custom_buttom.dart';
import 'package:ecommerce_full/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_full/core/view_model/cart_view_model.dart';
import 'package:ecommerce_full/view/cart_view.dart';

class DetailsView extends StatelessWidget {
  final ProductModel model;

  const DetailsView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 270,
            child: Image.network(
              model.image,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    CustomText(
                      text: model.name,
                      fontSize: 26,
                      maxLine: 2,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CustomText(
                                text: 'Size',
                                maxLine: 2,
                              ),
                              CustomText(
                                text: model.sized,
                                maxLine: 2,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          width: MediaQuery.of(context).size.width * .44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const CustomText(
                                text: 'Color',
                                maxLine: 2,
                              ),
                              Container(
                                width: 30,
                                height: 20,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20),
                                  color: model.color,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const CustomText(
                      text: 'Details',
                      fontSize: 18,
                      maxLine: 2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: model.description,
                      fontSize: 18,
                      height: 2.5,
                      maxLine: 2,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const CustomText(
                      text: "PRICE ",
                      fontSize: 22,
                      color: Colors.grey,
                      maxLine: 2,
                    ),
                    CustomText(
                      text: ' \R${model.price}',
                      color: primaryColor,
                      fontSize: 18,
                      maxLine: 2,
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: 180,
                  height: 100,
                  child: CustomButton(
                    onPress: () {
                      Get.find<CartViewModel>().addProduct(model);
                      Get.snackbar('Cart', 'Product added to cart!');
                      Get.to(() => const CartView());
                    },
                    text: 'Add',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
