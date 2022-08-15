import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Digite o seu email';
  }
  if (!email.isEmail) return 'Digite um email válido';
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Digite uma senha';
  }
  if (password.length < 7) {
    return 'Digite uma senha com pelo menos 7 caracteres.';
  }
  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Digite um nome';
  }
  final names = name.split(' ');
  if (names.length == 1) return 'Digite o seu nome completo';
  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Digite o telefone';
  }

  if (phone.length < 14 || !phone.isPhoneNumber) {
    return 'Digite um número válido';
  }
  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return 'Digite um CPF';
  }
  if (!cpf.isCpf) {
    return 'Digite um cpf válido';
  }
  return null;
}
