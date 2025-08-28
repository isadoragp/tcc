class CaregiverModel {
  final String id;
  final String name;
  final String email;
  final String cpf;
  final String birthDate;
  final String phone;

  CaregiverModel({
    required this.id,
    required this.name,
    required this.email,
    required this.cpf,
    required this.birthDate,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'cpf': cpf,
      'birthDate': birthDate,
      'phone': phone,
    };
  }

  factory CaregiverModel.fromMap(Map<String, dynamic> map) {
    return CaregiverModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      cpf: map['cpf'] ?? '',
      birthDate: map['birthDate'] ?? '',
      phone: map['phone'] ?? '',
    );
  }
}
