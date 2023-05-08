
class UserModel {
  int? id;
  String? name;
  String? email;


  UserModel.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    email = map['email'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    return map;
  }
}
