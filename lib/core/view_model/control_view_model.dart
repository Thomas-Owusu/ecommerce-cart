import 'package:ecommerce_full/view/cart_view.dart';
import 'package:ecommerce_full/view/home_view.dart';
import 'package:ecommerce_full/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  Widget currentScreen = HomeView();

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen = HomeView();
          break;
        }
      case 1:
        {
          currentScreen =  CartView();
          break;
        }
      case 2:
        {
          currentScreen = const ProfileView();
          break;
        }
    }
    update();
  }
}
