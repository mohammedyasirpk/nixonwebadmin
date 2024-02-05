// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SignBotton extends StatelessWidget {
  final Function()? onTap;
  final bool isloading;
  final String text;
  const SignBotton({
    super.key,
    required this.onTap,
    required this.text,
    required this.fieldIsfilled,
   required this.isloading,
  });
  final bool fieldIsfilled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width + 10,
        height: 50,
        decoration: BoxDecoration(
          color: fieldIsfilled ? Colors.deepPurple[200] : Colors.deepPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: isloading
                ? Text(
                    text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                : const CircularProgressIndicator(
                    color: Colors.white,
                  )),
      ),
    );
  }
}
