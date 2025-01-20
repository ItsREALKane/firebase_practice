import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/person_controller.dart';
import '../../models/person_model.dart';

class HomePage extends StatelessWidget {
  final PersonController controller = Get.put(PersonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          'Pemain Sepak Bola',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        color: Colors.grey[200],
        child: Obx(() {
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: controller.persons.length,
            itemBuilder: (context, index) {
              final person = controller.persons[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text(
                    person.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8.0),
                      Text('Age: ${person.age}',
                          style: TextStyle(color: Colors.grey[700])),
                      Text('Location: ${person.location}',
                          style: TextStyle(color: Colors.grey[700])),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.indigo),
                        onPressed: () => _showForm(context, person),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () => controller.deletePerson(person.id),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, null),
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showForm(BuildContext context, PersonModel? person) {
    final nameController = TextEditingController(text: person?.name ?? '');
    final ageController =
        TextEditingController(text: person != null ? '${person.age}' : '');
    final locationController =
        TextEditingController(text: person?.location ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          title: Text(
            person == null ? 'Add Person' : 'Edit Person',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    labelText: 'Location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();
                final age = int.tryParse(ageController.text.trim()) ?? 0;
                final location = locationController.text.trim();

                if (name.isNotEmpty && age > 0 && location.isNotEmpty) {
                  if (person == null) {
                    controller.addPerson(
                      PersonModel(
                        id: '',
                        name: name,
                        age: age,
                        location: location,
                      ),
                    );
                  } else {
                    controller.updatePerson(
                      PersonModel(
                        id: person.id,
                        name: name,
                        age: age,
                        location: location,
                      ),
                    );
                  }
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
