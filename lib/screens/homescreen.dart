import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Row(
          children: [
            const SizedBox(width: 20), 
            const Text(
              "Hello Anthony",
              style: TextStyle(
                fontSize: 35, 
                fontWeight: FontWeight.bold, 
              ),
            ),
            const SizedBox(width: 60), 
            IconButton(
              onPressed: () {
                debugPrint("account");
              },
              icon: const Icon(Icons.account_circle,size: 40,),
            ),
          ],
        ),
        ),
        body: SingleChildScrollView(
          child: Center(child: ScalingCirclePattern()),
        ),
      ),
    );
  }
}

class ScalingCirclePattern extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20), // Add side margins
      child: Column(
        children: [
          // Four circles scaling from left to right
          for (int i = 0; i < 4; i++)
            _buildCircleRow(context, i, true),
          SizedBox(height: 20), // Space between the two sets
          // Four circles scaling from right to left
          for (int i = 0; i < 4; i++)
            _buildCircleRow(context, i, false),
        ],
      ),
    );
  }

  Widget _buildCircleRow(BuildContext context, int index, bool isLeftToRight) {
    double leftPadding = isLeftToRight ? index * 70.0 : 0;
    double rightPadding = isLeftToRight ? 0 : index * 80.0;

    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: Row(
        mainAxisAlignment: isLeftToRight ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          _buildCircle(context, index),
        ],
      ),
    );
  }

  Widget _buildCircle(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 38, 255, 0),
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Circle ${index + 1} tapped!')),
          );
        },
      ),
    );
  }
}