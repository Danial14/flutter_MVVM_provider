class UserModel {
  UserModel({
      this.token,});

  UserModel.fromJson(dynamic json) {
    token = json['token'];
  }
  String token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    return map;
  }

}