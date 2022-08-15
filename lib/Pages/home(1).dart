// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:irdc__attend/NavigationBar/NavigationBar.dart';
import 'package:irdc__attend/lists/list(2).dart';
import 'package:irdc__attend/lists/list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const breakpoint = 600.0;
    return Scaffold(
      body: Row(
        children: [
          //this is the navigation bar
          navigationBar(),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 50,
                top: 40,
              ),
              //this column is for the lists (1,2)
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  Text(
                    "Attendance list",
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff333951)),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(child: List()),
                  Text(
                    "Event list",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff333951)),
                  ),
                  // here is the second list
                  Expanded(child: List_2()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
