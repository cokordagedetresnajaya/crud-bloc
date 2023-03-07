import 'package:flutter/material.dart';
import '../../bloc/export.dart';

class EditPage extends StatelessWidget {
  final User user;
  EditPage(this.user);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = context.read<UserBloc>();
    nameController.text = user.name;
    ageController.text = user.age.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EDIT USER',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: ageController,
            decoration: const InputDecoration(
              labelText: 'Age',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              userBloc.add(
                EditUserEvent(
                  User(
                    id: user.id,
                    name: nameController.text,
                    age: int.parse(ageController.text),
                  ),
                ),
              );

              Navigator.pop(context);
            },
            child: const Text(
              'EDIT USER',
            ),
          ),
        ],
      ),
    );
  }
}
