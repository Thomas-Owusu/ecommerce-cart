import 'package:ecommerce_full/core/view_model/auth_view_model.dart';
import 'package:ecommerce_full/view/auth/register_view.dart';
import 'package:ecommerce_full/view/widgets/custom_buttom.dart';
import 'package:ecommerce_full/view/widgets/custom_button_social.dart';
import 'package:ecommerce_full/view/widgets/custom_text.dart';
import 'package:ecommerce_full/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginView({  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 20,
          left: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: "Welcome,",
                    fontSize: 30, maxLine: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(RegisterView());
                    },
                    child: const CustomText(
                      text: "Sign Up",
                      color: primaryColor,
                      fontSize: 18,
                      maxLine: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                text: 'Sign in to Continue',
                fontSize: 14,
                color: Colors.grey,
                maxLine: 2,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                labelText: 'Email',
                hint: 'Enter your email',
                onSave: (value) {
                  controller.email = value!;
                },
                validator: (value) {
                  if (value == null) {
                    print("ERROR");
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                labelText: 'Password',
                hint: 'Enter your password',
                onSave: (value) {
                  controller.password = value!;
                },
                validator: (value) {
                  if (value == null) {
                    print('error');
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: 'Forgot Password?',
                fontSize: 14,
                alignment: Alignment.topRight,
                maxLine: 2,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                onPress: () {
                  _formKey.currentState!.save();

                  if (_formKey.currentState!.validate()) {
                    controller.signInWithEmailAndPassword();
                  }
                },
                text: 'SIGN IN',
              ),
              const SizedBox(
                height: 40,
              ),
              const CustomText(
                text: '-OR-',
                alignment: Alignment.center,
                maxLine: 2,
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButtonSocial(
                text: 'Sign In with Facebook',
                onPress: () {
                  // controller.facebookSignInMethod();
                },
                imageName: 'assets/images/facebook.png',
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButtonSocial(
                text: 'Sign In with Google',
                onPress: () {
                  // controller.googleSignInMethod();
                },
                imageName: 'assets/images/google.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
