import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/person_controller.dart';
import '../models/person_model.dart';

class HomePage extends StatelessWidget {
  final PersonController controller = Get.put(PersonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Firebase')),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.persons.length,
          itemBuilder: (context, index) {
            final person = controller.persons[index];
            return Card(
              child: ListTile(
                title: Text('Name: ${person.name}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Age: ${person.age}'),
                    Text('Location: ${person.location}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _showForm(context, person),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => controller.deletePerson(person.id),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, null),
        child: const Icon(Icons.add),
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
          title: Text(person == null ? 'Add Person' : 'Edit Person'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Age'),
              ),
              TextField(
                controller: locationController,
                decoration: const InputDecoration(labelText: 'Location'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();
                final age = int.tryParse(ageController.text.trim()) ?? 0;
                final location = locationController.text.trim();

                if (name.isNotEmpty && age > 0 && location.isNotEmpty) {
                  if (person == null) {
                    controller.addPerson(
                      PersonModel(id: '', name: name, age: age, location: location),
                    );
                  } else {
                    controller.updatePerson(
                      PersonModel(id: person.id, name: name, age: age, location: location),
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
