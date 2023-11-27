import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeController extends GetxController {
  double? latitude;
  double? longtitude;
  TextEditingController emailEdittingController = TextEditingController();
  TextEditingController passWordEdittingController = TextEditingController();
  TextEditingController searchEdittingController = TextEditingController();
  RxBool showPassword = false.obs;
  var _googleSignin = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);
  var _googleAccount = Rx<GoogleSignInAccount?>(null);

  // togglepassword
  void togglePassword() {
    showPassword.value = !showPassword.value;
  }

  //sigin with google
  Future<void> signinWithGoogle() async {
    try {
      // await _googleSignin.signIn();
      _googleAccount.value = await _googleSignin.signIn();
      if (_googleAccount == null) {
      } else {
        print("ok");
        _googleAccount.value?.displayName ?? "";
      }
    } catch (e) {}
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // togglePassword();
  }

  @override
  void onReady() {
    super.onReady();
    togglePassword();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
