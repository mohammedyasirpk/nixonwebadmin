import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnalyzeTiles extends StatelessWidget {
  const AnalyzeTiles({super.key, required this.title, required this.icon});
  final String title;
  final  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 10),
      child: Container(
        width: 200,
        height: 40,
        decoration: BoxDecoration(
          color:  const Color(0xff00A693) ,
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Icon(
              icon,
              size: 16,
              color: Colors.white,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5, right: 5),
            child: Text(
              // ignore: unnecessary_string_interpolations
              '$title',
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }
}