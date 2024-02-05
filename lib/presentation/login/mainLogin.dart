import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/widgets/tiltle.dart';
import 'widgets/login_container.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.only(left: 40,right: 40,top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
               Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ApployeImageWidget(),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 400,
                      child: Text(
                        "#1 Time Tracker App for desk, mobile & remote teams.",
                        style: GoogleFonts.aBeeZee(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(150),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("lib/images/ux.png"))),
                    )
                  ],
                ),
                  
           
             const LoginContainer()
            ],
          ),
        ),
      ),
    );
  }
}
