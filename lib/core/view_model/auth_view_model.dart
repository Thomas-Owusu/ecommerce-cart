import 'package:ecommerce_full/core/service/firestore_user.dart';
import 'package:ecommerce_full/model/user_model.dart';
import 'package:ecommerce_full/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  String email = '', password = '', name = '';

  final Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  // Email/Password Sign In
  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
       Get.to(() => HomeView());
    } catch (e) {
      showError('Error login account', e.toString());
    }
  }

  // Email/Password Sign Up
  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((userCredential) async {
        await saveUser(userCredential);
      });
      Get.offAll(() => HomeView());
    } catch (e) {
      showError('Error creating account', e.toString());
    }
  }


  // Save user to Firestore
  Future<void> saveUser(UserCredential userCredential) async {
    final user = userCredential.user;
    if (user == null) return;

    await FireStoreUser().addUserToFireStore(UserModel(
      userId: user.uid,
      email: user.email ?? '',
      name: name.isNotEmpty ? name : (user.displayName ?? ''),
      pic: user.photoURL ?? '',
    ));
  }

  // Common error snackbar
  void showError(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
