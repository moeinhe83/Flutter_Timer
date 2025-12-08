import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ==================== /* moeinstyle For Text */ ====================
const moeinstyle1 = TextStyle(fontSize: 80, color: Colors.black);

// ==================== /* MyApp */ ====================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// ==================== /* HomePage StatefulWidget */ ====================
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Timer App",
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              tooltip: "StopWatch",
              onPressed: () {},
              icon: Icon(
                Icons.watch_later,
                color: Colors.black,
                size: 30,
              ),
            ),
            SizedBox(width: 50),
            IconButton(
              tooltip: "Timer",
              onPressed: () {},
              icon: Icon(Icons.timer, size: 30, color: Colors.black),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("00", style: moeinstyle1),
              Text(":", style: moeinstyle1),
              Text("00", style: moeinstyle1),
              Text(":", style: moeinstyle1),
              Text("00", style: moeinstyle1),
            ],
          ),
        ],
      ),
    );
  }
}
