import 'dart:math';

import 'package:flutter/material.dart';
import '../../bloc/export.dart';

class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ADD USER',
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
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              userBloc.add(
                AddUserEvent(User(
                  id: Random().nextInt(99999),
                  name: nameController.text,
                  age: int.parse(ageController.text),
                )),
              );

              Navigator.pop(context);
            },
            child: const Text(
              'ADD USER',
            ),
          ),
        ],
      ),
    );
  }
}
