import 'package:flutter/material.dart';
import '../add/add.dart';
import '../edit/edit.dart';
import '../../bloc/export.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = context.read<UserBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ALL USERS',
        ),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        bloc: userBloc,
        builder: (context, state) {
          if (state.allUsers.isEmpty) {
            return const Center(
              child: Text('No Users'),
            );
          }

          return ListView.builder(
            itemCount: state.allUsers.length,
            itemBuilder: ((context, index) {
              User user = state.allUsers[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(user.name),
                subtitle: Text('${user.age} years old'),
                trailing: IconButton(
                  onPressed: () {
                    userBloc.add(DeleteUserEvent(user));
                  },
                  icon: const Icon(
                    Icons.delete,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => EditPage(user)),
                    ),
                  );
                },
              );
            }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => AddPage()),
            ),
          );
        },
      ),
    );
  }
}
