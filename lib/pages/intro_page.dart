import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop/components/widgettest.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget{
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(

        children: [
          //logo
          Padding(
              padding:  const EdgeInsets.only(
                  left: 80,
                  right: 80,
                  bottom: 40,
                  top: 160
              ),
              child: Image.asset(
                  'lib/assets/images/basket.png',
                  width: 10000,
              ),
          ),
          //we deliver groceries at your doorstep
           Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
                "We deliver groceries at your doorstep",
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 24),

          Text(
              "Fresh items everyday",
               style: TextStyle(color: Colors.grey[600]),
          ),

          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context){
                    return const HomePage();
                  }
              )),


          child: Container(
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(500),
            ),
            padding: const EdgeInsets.all(15),
            child: const Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
            ),
          ),
    ),
    const Spacer(),
          ],
      ),
    );
  }
}