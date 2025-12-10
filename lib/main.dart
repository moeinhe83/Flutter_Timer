import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ==================== /* moeinstyle For Text */ ====================
const moeinstyle1 = TextStyle(fontSize: 80, color: Colors.white);

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
      backgroundColor: const Color.fromARGB(255, 34, 34, 34),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Info()),
            );
          },
          icon: Icon(Icons.info, size: 40, color: Colors.amber),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Timer App",
          style: TextStyle(
            fontSize: 30,
            color: Colors.amber,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              tooltip: "StopWatch",
              onPressed: () {},
              icon: Icon(
                Icons.watch_later,
                color: Colors.amber,
                size: 30,
              ),
            ),
            SizedBox(width: 100),
            IconButton(
              tooltip: "Timer",
              onPressed: () {},
              icon: Icon(Icons.timer, size: 30, color: Colors.amber),
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

// ==================== /* info StatelessWidget */ ====================
class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 41, 41, 41),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.backspace,
              size: 30,
              color: Colors.amber,
            ),
          ),
          centerTitle: true,
          title: Text(
            "About Timer App",
            style: TextStyle(
              fontSize: 30,
              color: Colors.amber,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Container(
                  height: 100,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "moeinit.com",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
