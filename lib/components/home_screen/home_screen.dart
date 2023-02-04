import 'package:ai_flow/components/home_screen/select_applet_grid.dart';
import 'package:ai_flow/resources/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              // TODO: Profile button
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SelectAppletGridView(
              title: "Your Apps",
              // TODO: Get user applets
              applets: [],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SelectAppletGridView(
              title: "Marketplace",
              // TODO: Get marketplace collection
              applets: [],
            ),
          ),
          const SizedBox(
            height: kBottomNavigationBarHeight + kRadialReactionRadius + 10,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, createRoute);
        },
        backgroundColor: const Color.fromARGB(255, 128, 81, 209),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
