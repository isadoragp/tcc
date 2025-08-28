class UserModel {
  final String id;
  final String name;
  final String email;
  final String cpf;
  final String birthDate;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.cpf,
    required this.birthDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'cpf': cpf,
      'birthDate': birthDate,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      cpf: map['cpf'] ?? '',
      birthDate: map['birthDate'] ?? '',
    );
  }
}

