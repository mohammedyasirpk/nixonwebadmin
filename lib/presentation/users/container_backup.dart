// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:nixon/domain/models/usermodel.dart';
// import 'package:nixon/repostitory/capitalise.dart';
// import 'package:nixon/repostitory/user_repo.dart';

// class UserContainer extends StatelessWidget {
//   UserContainer({
//     Key? key,
//     required this.userdata,
//   }) : super(key: key);

//   final UserModel userdata;
// //
//   String service = "service";
//   String production = "production";
//   String dealer = "dealer";
//   String admin = "admin";


//   void updateRoleFunction(String role) {
//     UserRepo.instance.updateRole(role: role, docid: userdata.employeeId!);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ValueNotifier<String> selectedValuePopUp =
//         ValueNotifier(userdata.role ?? "user");
//         print(userdata.role);
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Container(
//         width: double.infinity,
//         height: 60,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           children: [
//             const SizedBox(
//               width: 10,
//             ),
            
//             Expanded(child: Text(userdata.name?.capitalize() ?? "")),
//             Expanded(child: Text(userdata.email.capitalize())),
//             Expanded(child: Text(userdata.phoneNo?.capitalize() ?? "")),
//             Expanded(
//               child: PopupMenuButton(
//                 child: Row(
//                   children: [
//                     ValueListenableBuilder(
//                       valueListenable: selectedValuePopUp,
//                       builder: (context, value, child) => Text(selectedValuePopUp.value),
//                     ),
//                     const Icon(Icons.arrow_upward)
//                   ],
//                 ),
//                 itemBuilder: (context) {
//                   return [
//                     PopupMenuItem<String>(
//                       value: dealer,
//                       child: Text(dealer),
//                       onTap: () {
//                         updateRoleFunction(dealer);
//                       },
//                     ),
//                     PopupMenuItem<String>(
//                       value: service,
//                       child: Text(service),
//                       onTap: () {
//                         updateRoleFunction(service);
//                       },
//                     ),
//                     PopupMenuItem<String>(
//                       value: production,
//                       child: Text(production),
//                       onTap: () {
//                         updateRoleFunction(production);
//                       },
//                     ),
//                      PopupMenuItem<String>(
//                       value: admin,
//                       child: Text(admin),
//                       onTap: () {
//                         updateRoleFunction(admin);
//                       },
//                     ),
//                   ];
//                 },
//                 onSelected: (value) {
//                   selectedValuePopUp.value = value;
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
