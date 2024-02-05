// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nixon/domain/models/usermodel.dart';
import 'package:nixon/repostitory/capitalise.dart';
import 'package:nixon/repostitory/user_repo.dart';

class UserContainer extends StatelessWidget {
  UserContainer({
    Key? key,
    required this.userdata,
    required this.index,
  }) : super(key: key);

  final UserModel userdata;
  final int index;

  String service = "service";
  String production = "production";
  String dealer = "dealer";
  String admin = "admin";

  void updateRoleFunction(String role) {
    UserRepo.instance.updateRole(role: role, docid: userdata.employeeId!);
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> selectedValuePopUp =
        ValueNotifier(userdata.role ?? "user");
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200]),
              child: Center(child: Text((index + 1).toString())),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(flex: 4, child: Text(userdata.name?.capitalize() ?? "")),
            Expanded(flex: 2, child: Text(userdata.email.capitalize())),
            Expanded(
                flex: 1, child: Text(userdata.phoneNo?.capitalize() ?? "")),
            Expanded(
              flex: 1,
              child: PopupMenuButton<String>(
                child: Row(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: selectedValuePopUp,
                      builder: (context, value, child) =>
                          Text(selectedValuePopUp.value),
                    ),
                    const Icon(Icons.arrow_drop_down)
                  ],
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem<String>(
                      value: dealer,
                      child: Text(dealer),
                      onTap: () {
                        updateRoleFunction(dealer);
                      },
                    ),
                    PopupMenuItem<String>(
                      value: service,
                      child: Text(service),
                      onTap: () {
                        updateRoleFunction(service);
                      },
                    ),
                    PopupMenuItem<String>(
                      value: production,
                      child: Text(production),
                      onTap: () {
                        updateRoleFunction(production);
                      },
                    ),
                    PopupMenuItem<String>(
                      value: admin,
                      child: Text(admin),
                      onTap: () {
                        updateRoleFunction(admin);
                      },
                    ),
                  ];
                },
                onSelected: (value) {
                  selectedValuePopUp.value = value;
                },
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
