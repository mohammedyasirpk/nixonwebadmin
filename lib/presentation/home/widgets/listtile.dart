import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget(
      {super.key,
      required this.iconText,
      required this.boxShape,
      required this.text,
      required this.onTap});
  final String iconText;
  final BoxShape boxShape;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(color: Colors.grey, shape: boxShape),
            child: Center(
              child: Text(
                iconText,
                style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: GoogleFonts.poppins(),
          ),
        ],
      ),
    );
  }
}
