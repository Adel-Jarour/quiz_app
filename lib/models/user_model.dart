
class UserModel {
  int? id;
  String? name;
  String? email;


  UserModel.fromMap(Map<String, dynamic> map) {
    name = map['username'];
    email = map['email'];
  }
}
