

import 'package:flutter/material.dart';
import 'package:list/main.dart';
import 'package:list/mainpage.dart';



class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height / 20,
          ),
          Container(
            height: size.height / 1.5,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: size.height / 30,
          ),
          Container(
            width: size.width / 1.15,
            child: Text(
              "Get to your ideal body",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 5, 134, 151),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              width: size.width / 1.15,
              child: Text(
                "by exercising at home",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 5, 134, 151),
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
