class UserModel {
  String? fullname;
  String? email;
  String? phone;
  String? cpf;
  String? password;
  String? id;
  String? token;

  UserModel({
    this.fullname,
    this.email,
    this.cpf,
    this.password,
    this.phone,
    this.id,
    this.token,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      cpf: map['cpf'],
      email: map['email'],
      fullname: map['fullname'],
      phone: map['phone'],
      id: map['objectId'],
      token: map['sessionToken'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cpf': cpf,
      'email': email,
      'fullname': fullname,
      'phone': phone,
      'id': id,
      'token': token,
    };
  }
}
