import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app/db_controller/db_provider.dart';
import 'package:quiz_app/models/user_model.dart';
import 'package:quiz_app/routing/routes.dart';

class LoginController extends GetxController {
  late TextEditingController name;
  late TextEditingController email;

  GlobalKey<FormState> formKey;

  LoginController({required this.formKey});

  bool isLogin = false;

  bool checkData() {
    if (formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }

  void saveDataToDB() {
  DBProvider? dbProvider = DBProvider.instance;
  UserModel user = UserModel.fromMap({
    "name" : name.text,
    "email" : email.text
  });
  dbProvider?.insertUser(user: user);
  }

  void performLogin() {
    if (checkData()) {
      isLogin = true;
      update();
      // save data in sql db
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
