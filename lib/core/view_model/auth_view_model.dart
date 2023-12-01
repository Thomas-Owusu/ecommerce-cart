import 'package:ecommerce_full/core/service/firestore_user.dart';
import 'package:ecommerce_full/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Rxn<User> _user = Rxn<User>();
  User? get user => _user.value;  // Expose full User object

  String email = '', password = '', name = '';

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // No navigation here — UI reacts automatically
    } catch (e) {
      showError('Error logging in', e.toString());
    }
  }

  Future<void> createAccountWithEmailAndPassword() async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((userCredential) async {
        await saveUser(userCredential);
      });
      // No navigation here — UI reacts automatically
    } catch (e) {
      showError('Error creating account', e.toString());
    }
  }

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

  void showError(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
