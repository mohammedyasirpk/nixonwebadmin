import 'package:flutter/material.dart';

class ApployeImageWidget extends StatelessWidget {
  const ApployeImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
         height: 150,
          width: 150,
          child: Image.asset('lib/images/Kayla log.png'),
        ),
        // SizedBox(
        //   height: 40,
        //   width: 120,
        //   child: Image.asset('lib/images/apployee.png'),
        // ),
      ],
    );
  }
}
