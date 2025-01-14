class PersonModel {
  String id;
  String name;
  int age;
  String location;

  PersonModel(
      {required this.id,
      required this.name,
      required this.age,
      required this.location});

  factory PersonModel.fromMap(Map<String, dynamic> data, String documentId) {
    return PersonModel(
      id: documentId,
      name: data['name'] ?? '',
      age: data['age'] ?? 0,
      location: data['location'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'location': location,
    };
  }
}
