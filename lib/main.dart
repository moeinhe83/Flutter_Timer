import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

// ==================== /* moeinstyle For Text */ ====================
const moeinstyle1 = TextStyle(fontSize: 80, color: Colors.cyan);

// ==================== /* MyApp */ ====================
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: HomePage(onThemeChanged: toggleTheme),
    );
  }
}

// ==================== /* HomePage StatefulWidget */ ====================
class HomePage extends StatefulWidget {
  final Function(bool) onThemeChanged;
  const HomePage({super.key, required this.onThemeChanged});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Info()),
            );
          },
          icon: const Icon(Icons.info, size: 40, color: Colors.amber),
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
        actions: [
          Switch(
            // ignore: deprecated_member_use
            activeColor: Colors.white,
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: widget.onThemeChanged,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            IconButton(
              tooltip: "StopWatch",
              onPressed: null,
              icon: Icon(
                Icons.watch_later,
                color: Colors.amber,
                size: 30,
              ),
            ),
            SizedBox(width: 100),
            IconButton(
              tooltip: "Timer",
              onPressed: null,
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
            children: const <Widget>[
              Text("00", style: moeinstyle1),
              Text(":", style: moeinstyle1),
              Text("00", style: moeinstyle1),
              Text(":", style: moeinstyle1),
              Text("00", style: moeinstyle1),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Colors.amber,
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Start",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
              const SizedBox(width: 20),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Colors.amber,
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Reset",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ==================== /* Info StatelessWidget */ ====================
class Info extends StatelessWidget {
  const Info({super.key});
  Future<void> _openmoeinit() async {
    final Uri url = Uri.parse("https://moeinit.com");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 41, 41),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.backspace,
            size: 30,
            color: Colors.amber,
          ),
        ),
        centerTitle: true,
        title: const Text(
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
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "moeinit.com 💻",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Colors.amber,
                        ),
                      ),
                      onPressed: _openmoeinit,
                      child: Text(
                        "Open moeinit.com",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
