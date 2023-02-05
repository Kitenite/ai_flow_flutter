import 'package:ai_flow/components/home_screen/select_applet_grid.dart';
import 'package:ai_flow/models/user.dart';
import 'package:ai_flow/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = context.watch<User>();
    print("user ${user.id}");
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
        children: const [
          Expanded(
            child: SelectAppletGridView(
              title: "Your Apps",
              // TODO: Get user applets
              applets: [],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SelectAppletGridView(
              title: "Marketplace",
              // TODO: Get marketplace collection
              applets: [],
            ),
          ),
          SizedBox(
            height: kBottomNavigationBarHeight + kRadialReactionRadius + 10,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Constants.createRoute);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
