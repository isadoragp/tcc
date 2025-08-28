class ElderModel {
  final String id;
  final String name;
  final String cpf;
  final String birthDate;
  final String healthNotes;

  ElderModel({
    required this.id,
    required this.name,
    required this.cpf,
    required this.birthDate,
    required this.healthNotes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'cpf': cpf,
      'birthDate': birthDate,
      'healthNotes': healthNotes,
    };
  }

  factory ElderModel.fromMap(Map<String, dynamic> map) {
    return ElderModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      cpf: map['cpf'] ?? '',
      birthDate: map['birthDate'] ?? '',
      healthNotes: map['healthNotes'] ?? '',
    );
  }
}

