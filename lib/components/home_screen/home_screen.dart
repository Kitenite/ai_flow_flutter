import 'package:ai_flow/components/home_screen/select_applet_grid.dart';
import 'package:ai_flow/models/collection.dart';
import 'package:ai_flow/models/user.dart';
import 'package:ai_flow/resources/constants.dart';
import 'package:ai_flow/sao/collections.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = context.watch<User>();
    print("user ${user.id} ${user.collectionIds}");
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
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("I'm sure this will do something soon..."),
              ));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (String collectionId in user.collectionIds)
              Column(
                children: [
                  CollectionView(collectionId: collectionId),
                  const SizedBox(height: 20),
                ],
              ),
            const SizedBox(height: kBottomNavigationBarHeight),
          ],
        ),
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

class CollectionView extends StatelessWidget {
  const CollectionView({
    super.key,
    required this.collectionId,
  });

  final String collectionId;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Collection>(
      create: (BuildContext context) =>
          CollectionDataAccessor.streamCollection(collectionId),
      initialData: Collection(name: "Loading..."),
      child: const SizedBox(
        height: 300,
        child: SelectAppletGridView(),
      ),
    );
  }
}
