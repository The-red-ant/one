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
        appBar: AppBar(
          title: Row(
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
                icon: const Icon(Icons.account_circle, size: 40),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HealthcareBanner(),
              Center(child: ScalingCirclePattern()),
            ],
          ),
        ),
      ),
    );
  }
}

class HealthcareBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      color: Colors.blue[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Unit 1',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Exploring the foundations of healthcare to build a strong knowledge base for your medical journey.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue[800],
            ),
          ),
        ],
      ),
    );
  }
}

class ScalingCirclePattern extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          for (int i = 0; i < 4; i++)
            _buildCircleRow(context, i, true),
          SizedBox(height: 20),
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