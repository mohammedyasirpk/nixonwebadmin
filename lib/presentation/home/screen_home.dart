// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nixon/presentation/home/widgets/usersection.dart';

import 'package:nixon/presentation/login/widgets/signin_container.dart';
import 'package:nixon/presentation/users/admin.dart';
import 'package:nixon/presentation/users/prodution.dart';
import 'package:nixon/presentation/users/service.dart';

import '../../repostitory/auth.repo.dart';
import '../users/alluser.dart';
import '../users/dealer.dart';
import 'widgets/analysis.dart';
import 'pages/dashboard.dart';
import 'widgets/expansion.dart';
import 'widgets/expansiontile.dart';
import 'widgets/live.dart';
import 'widgets/maintext.dart';
import 'widgets/tiltle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ValueNotifier<int> selectedValueNotifier;
  late Widget selectScreen;

  final pages = [MyDashBoard(), LiveSection(), AllUsers(),AllDealers(),AllService(),AllProduction(),AllAdmin()];

  @override
  void initState() {
    super.initState();
    selectedValueNotifier = ValueNotifier<int>(0);
    selectScreen = pages[selectedValueNotifier.value];
  }

  @override
  void dispose() {
    selectedValueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left side
          SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ApployeImageWidget(),
                MainText(title: "Analyze"),
                GestureDetector(
                  onTap: () {
                   selectedValueNotifier.value = 0;
                  },
                  child: AnalyzeTiles(
                    icon: Icons.tv_outlined,
                    title: "DashBoard",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    selectedValueNotifier.value = 1;
                  },
                  child: AnalyzeTiles(
                    icon: Icons.tv_outlined,
                    title: "Live Feed",
                  ),
                ),
                Divider(),
                SizedBox(
                    width: 300,
                    child: UserTile(
                      ontap1: () {
                       selectedValueNotifier.value = 2;
                      },
                      ontap2: () {
                        selectedValueNotifier.value = 3;
                      },
                      ontap3: () {
                            selectedValueNotifier.value = 4;
                      },
                      ontap4: () {
                            selectedValueNotifier.value = 5;
                      },
                      ontap5: () {
                            selectedValueNotifier.value = 6;
                      },
                      mainTitle: "Users",
                      iconsText1: "A",
                      listTileText1: "All Users",
                      listTileText2: "Dealers",
                      iconsText2: "D",
                      iconsText3: "S",
                      listTileText3: "Services",
                      iconsText4: "P",
                      listTileText4: "Production",
                      iconsText5: "A",
                      listTileText5: "Admin",
                    )),
                Divider(),
                SizedBox(
                  width: 300,
                  child: ExpansionTileWidget(
                    ontap1: () {},
                    ontap2: () {},
                    ontap3: () {},
                    mainTitle: "Time Sheets",
                    iconsText1: "D",
                    listTileText1: "Daily",
                    iconsText2: "W",
                    iconsText3: "M",
                    listTileText2: "Weekly",
                    listTileText3: "Monthly",
                  ),
                ),
                Divider(),
                SizedBox(
                  width: 300,
                  child: ExpansionTileWidget(
                    ontap1: () {},
                    ontap2: () {},
                    ontap3: () {},
                    mainTitle: "Report",
                    iconsText1: "T",
                    listTileText1: "Time And Activity",
                    iconsText2: "M",
                    iconsText3: "A",
                    listTileText2: "Manual Time",
                    listTileText3: "Apps and Url",
                  ),
                ),
                MainText(title: "Manage"),
                Divider(),
                SizedBox(
                  width: 300,
                  child: ExpansionSecond(
                    ontap1: () {},
                    ontap2: () {},
                    mainTitle: "Attendance",
                    iconsText1: "C",
                    listTileText1: "ClockIN/ClockOUT",
                    iconsText2: "L",
                    listTileText2: "Leave",
                  ),
                ),
                Divider(),
                SizedBox(
                  width: 300,
                  child: ExpansionTileWidget(
                    ontap1: () {},
                    ontap2: () {},
                    ontap3: () {},
                    mainTitle: "Field Service",
                    iconsText1: "R",
                    listTileText1: "Route Map",
                    iconsText2: "J",
                    iconsText3: "G",
                    listTileText2: "Job site",
                    listTileText3: "Geofence ClockIn/ClockOut",
                  ),
                ),
                Divider(),
                SizedBox(
                  width: 300,
                  child: ExpansionSecond(
                    ontap1: () {
                      AuthRepo.instance.signout();
                      circleBool.value = true;
                    },
                    ontap2: () {},
                    mainTitle: "Profile",
                    iconsText1: "S",
                    listTileText1: "SignOut",
                    iconsText2: "P",
                    listTileText2: "Profile Page",
                  ),
                )
              ],
            ),
          ),

           Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: selectedValueNotifier,
              builder: (context, value, child) {
                return pages[value];
              },
            ),
          ),
        ],
      ),
    );
  }
}
