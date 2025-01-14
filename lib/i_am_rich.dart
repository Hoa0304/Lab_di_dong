import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            "I Am Rich",
            style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 255, 0, 123),
            ),
          ),
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/rich.jpg'),
                // width: 300,
                // height: 300,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
