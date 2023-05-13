import 'package:get/get.dart';
import 'package:quiz_app/db_controller/db_helper.dart';

class HomeController extends GetxController {


  String username = "";
  String email = "";

  Future getUser() async{
    final res = await DatabaseHelper().getUser();
    if (res!.isNotEmpty){
      username = res['username'];
      email = res['email'];
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUser();

  }
}
