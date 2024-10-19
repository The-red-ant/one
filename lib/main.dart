// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KindaCode.com')),
      body: const Center(
        child: Text(
          'Hello There',
          style: TextStyle(fontSize: 36),
        ),
      ),
      // implement BottomAppBar
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        notchMargin: 10,
        // make rounded corners & create a notch for the floating action button
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          StadiumBorder(),
        ),
        child: IconTheme(
          data: const IconThemeData(color: Colors.white, size: 36),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      debugPrint("Menu Pressed");
                    },
                    icon: const Icon(Icons.menu)),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      debugPrint("Cart Pressed");
                    },
                    icon: const Icon(Icons.shopping_cart)),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      debugPrint("History Pressed");
                    },
                    icon: const Icon(Icons.history)),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      debugPrint("Settings Pressed");
                    },
                    icon: const Icon(Icons.settings)),
              ],
            ),
          ),
        ),
      ),
      // implement the big floating action button
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          debugPrint("Floating Action Button Pressed");
        },
        backgroundColor: Colors.amber,
        shape: ShapeBorder.lerp(
          const CircleBorder(),
          const StadiumBorder(),
          0.5,
        ),
        child: const Icon(Icons.add),
      ),
      // position the floating action button
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}