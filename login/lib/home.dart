// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Center(
            child: Text(
              'You are logged in using biometric login',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 200,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/Login');
            },
            child: Text(
              'Go Back',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.underline,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
