class UserModel {
  String? fullname;
  String? email;
  String? username;
  String? phone;
  String? cpf;
  String? password;
  String? id;
  String? sessionToken;
  List<String>? favorites;
  UserModel({
    this.fullname,
    this.email,
    this.phone,
    this.cpf,
    this.password,
    this.id,
    this.sessionToken,
    this.username,
    this.favorites,
  });

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    if (fullname != null) {
      result.addAll({'fullname': fullname});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (username != null) {
      result.addAll({'username': username});
    }
    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (cpf != null) {
      result.addAll({'cpf': cpf});
    }
    if (password != null) {
      result.addAll({'password': password});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (sessionToken != null) {
      result.addAll({'sessionToken': sessionToken});
    }
    if (favorites != null) {
      result.addAll({'favorites': favorites});
    }

    return result;
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      fullname: map['fullname'],
      email: map['email'],
      username: map['username'],
      phone: map['phone'],
      cpf: map['cpf'],
      password: map['password'],
      id: map['id'],
      sessionToken: map['sessionToken'],
      favorites: List<String>.from(map['favorites'] ?? []),
    );
  }
}
