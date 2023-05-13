
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/user_model.dart';
import 'package:quiz_app/routing/routes.dart';

import '../db_controller/db_helper.dart';

class LoginController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  GlobalKey<FormState> formKey;

  LoginController({required this.formKey});

  bool isLogin = false;

  bool checkData() {
    if (formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }

  saveDataToDB() async {
    await DatabaseHelper().addUser(name.text, email.text);
  }

  void performLogin() async {
    if (checkData()) {
      isLogin = true;
      update();
      await saveDataToDB();
      isLogin = false;
      name.clear();
      email.clear();
      update();
      Get.toNamed(Routes.home);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    name = TextEditingController();
    email = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    email.dispose();
  }
}
