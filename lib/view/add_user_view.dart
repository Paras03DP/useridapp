import 'package:flutter/material.dart';
import 'package:getit/di/di.dart';
import 'package:getit/repository/user_repository.dart';

import '../model/user.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({Key? key}) : super(key: key);

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final birthTimeController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Add User", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 16.0),
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Id',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Date of Birth',
              ),
              controller: dobController,
              readOnly: true,
              onTap: () async {
                selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2050),
                );

                if (selectedDate != null) {
                  setState(
                    () {
                      dobController.text = selectedDate.toString();
                    },
                  );
                }
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: birthTimeController,
              readOnly: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Birth Time',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.access_time),
                  onPressed: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: selectedTime ?? TimeOfDay.now(),
                    );

                    if (pickedTime != null) {
                      setState(() {
                        selectedTime = pickedTime;
                        birthTimeController.text = pickedTime.format(context);
                      });
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                User user = User(
                  id: int.parse(idController.text.trim()),
                  name: nameController.text.trim(),
                  dob: dobController.text.trim(),
                  birthTime: birthTimeController.text.trim(),
                );
                getIt<UserRepository>().addUser(user);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('added'),
                  ),
                );
              },
              child: const Text('Add User'),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/displayUser');
              },
              child: const Text('Display User'),
            ),
          ],
        ),
      ),
    );
  }
}
