import 'package:flutter/material.dart';
import 'package:nixon/domain/models/usermodel.dart';
import 'package:nixon/presentation/users/widgets/user_container.dart';
import '../../repostitory/user_repo.dart';

class AllService extends StatelessWidget {
  const AllService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: FutureBuilder<List<UserModel>>(
          future: UserRepo.instance.getAllServies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No users found.'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  List<UserModel> userlist = snapshot.data!;
                  UserModel user = userlist[index];
                  return UserContainer(
                    index: index,
                    userdata: user,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
