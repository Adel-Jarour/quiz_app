import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/constance/color_const.dart';
import 'package:quiz_app/routing/routes.dart';
import 'package:quiz_app/widgets/custom_button.dart';

import '../widgets/custem_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          txt: "Home",
          color: ColorConst.primaryColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.sort,
              color: ColorConst.primaryColor,
            ),
          ),
        ),
      ),
      drawer: const DrawerWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/quiz.png"),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
            txt: "Let`s Start!",
            onTap: () {
              Get.toNamed(Routes.startQuiz);
            },
            width: 250.w,
          ),
        ],
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: ColorConst.primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30.r,
                  child: Image.asset("assets/images/user.png"),
                ),
                SizedBox(
                  height: 15.h,
                  width: double.infinity,
                ),
                const CustomText(
                  txt: "Adel & Salem",
                  color: Colors.white,
                ),
                SizedBox(
                  height: 5.h,
                ),
                const CustomText(
                  txt: "user.email@example.com",
                  color: Colors.white,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.create),
            title: const CustomText(
              txt: "Create quiz",
            ),
            onTap: () {
              Get.toNamed(Routes.createQuiz);
            },
          ),
          ListTile(
            leading: const Icon(Icons.quiz),
            title: const CustomText(
              txt: "Start quiz",
            ),
            onTap: () {
              Get.toNamed(Routes.startQuiz);
            },
          ),
          Divider(
            thickness: 1.2,
            indent: 20.w,
            endIndent: 20.w,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const CustomText(
              txt: "Exit",
            ),
            onTap: () {
              Get.toNamed(Routes.login);
            },
          ),
        ],
      ),
    );
  }
}
