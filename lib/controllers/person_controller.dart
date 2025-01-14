import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/person_model.dart';

class PersonController extends GetxController {
  final RxList<PersonModel> persons = <PersonModel>[].obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchPersons();
  }

  void fetchPersons() {
    _firestore.collection('persons').snapshots().listen((snapshot) {
      persons.value = snapshot.docs
          .map((doc) => PersonModel.fromMap(doc.data(), doc.id))
          .toList();
    });
  }

  Future<void> addPerson(PersonModel person) async {
    await _firestore.collection('persons').add(person.toMap());
  }

  Future<void> updatePerson(PersonModel person) async {
    await _firestore.collection('persons').doc(person.id).update(person.toMap());
  }

  Future<void> deletePerson(String id) async {
    await _firestore.collection('persons').doc(id).delete();
  }
}
