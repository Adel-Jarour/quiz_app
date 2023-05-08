import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/controllers/login_controller.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController(formKey: formKey));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 100.h),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/faq.png",
                scale: 10,
              ),
              SizedBox(
                height: 50.h,
              ),
              CustomTextFormField(
                label: "name",
                hintTxt: "name",
                controller: controller.name,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextFormField(
                label: "email",
                hintTxt: "email",
                controller: controller.email,
              ),
              SizedBox(
                height: 50.h,
              ),
              GetBuilder<LoginController>(
                builder: (_) => CustomButton(
                  txt: "LOGIN",
                  onTap: () {
                    controller.performLogin();
                  },
                  enabled: controller.isLogin,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
