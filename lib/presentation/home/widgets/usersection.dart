import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nixon/presentation/home/widgets/listtile.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.mainTitle,
    required this.iconsText1,
    required this.listTileText1,
    required this.listTileText2,
    required this.iconsText2,
    required this.iconsText3,
    required this.listTileText3,
    this.ontap1,
    this.ontap2,
    this.ontap3,
    required this.iconsText4,
    required this.listTileText4,
    required this.iconsText5,
    required this.listTileText5, this.ontap4, this.ontap5,
  });

  final String mainTitle;
  final String iconsText1;
  final String listTileText1;
  final String listTileText2;
  final String iconsText2;
  final String iconsText3;
  final String listTileText3;
  final String iconsText4;
  final String listTileText4;
  final String iconsText5;
  final String listTileText5;
  final void Function()? ontap1;
  final void Function()? ontap2;
  final void Function()? ontap3;
  final void Function()? ontap4;
  final void Function()? ontap5;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionTile(
        collapsedBackgroundColor: Colors.white,
        title: Row(
          children: [
            const Icon(
              Icons.track_changes_sharp,
              size: 16,
            ),
            Text(
              mainTitle,
              style: GoogleFonts.poppins(fontSize: 13),
            ),
          ],
        ),
        children: [
          Column(
            children: [
              Container(
                // Placeholder content for ExpansionTile
                height: 200, // Set a reasonable height or remove it
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListTileWidget(
                          onTap: ontap1,
                          iconText: iconsText1,
                          boxShape: BoxShape.circle,
                          text: listTileText1,
                        ),
                      ),
                      Expanded(
                        child: ListTileWidget(
                          onTap: ontap2,
                          iconText: iconsText2,
                          boxShape: BoxShape.circle,
                          text: listTileText2,
                        ),
                      ),
                      Expanded(
                        child: ListTileWidget(
                          onTap: ontap3,
                          iconText: iconsText3,
                          boxShape: BoxShape.circle,
                          text: listTileText3,
                        ),
                      ),
                      Expanded(
                        child: ListTileWidget(
                          onTap: ontap4,
                          iconText: iconsText4,
                          boxShape: BoxShape.circle,
                          text: listTileText4,
                        ),
                      ),
                      Expanded(
                        child: ListTileWidget(
                          onTap: ontap5,
                          iconText: iconsText5,
                          boxShape: BoxShape.circle,
                          text: listTileText5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
