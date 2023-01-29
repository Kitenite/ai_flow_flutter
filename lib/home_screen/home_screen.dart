import 'package:ai_flow/create_screen/create_screen.dart';
import 'package:ai_flow/home_screen/select_applet_grid.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ai Flow",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            color: Colors.black,
            tooltip: 'Profile button',
            onPressed: () {
              print("Profile button pressed");
            },
          ),
        ],
      ),
      body: Column(
        children: const <Widget>[
          Expanded(
            child: SelectAppletGridView(
              title: "Your Apps",
              applets: [
                "My app title",
                "My app title",
                "My app title",
                "My app title",
                "My app title",
                "My app title",
                "My app title",
                "My app title",
                "My app title",
                "My app title",
                "My app title",
                "My app title",
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SelectAppletGridView(
              title: "Marketplace",
              applets: [
                "My app title",
                "My app title",
                "My app title",
                "My app title",
                "My app title",
                "My app title",
              ],
            ),
          ),
          SizedBox(
            height: kBottomNavigationBarHeight,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateScreen()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 128, 81, 209),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Settings",
          icon: Icon(Icons.settings),
        ),
      ]),
    );
  }
}
