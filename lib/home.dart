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
          title: const Text("Ai Flow"),
          centerTitle: false,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.account_circle),
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
              child: SelectAppGridView(
                title: "Eat ass",
                apps: [
                  "App1",
                  "App1",
                  "App1",
                  "App1",
                  "App1",
                ],
              ),
            ),
            Expanded(
              child: SelectAppGridView(
                title: "Make money",
                apps: [
                  "App1",
                  "App1",
                  "App1",
                  "App1",
                  "App1",
                ],
              ),
            ),
          ],
        ));
  }
}

class SelectAppGridView extends StatelessWidget {
  const SelectAppGridView({
    super.key,
    required this.title,
    required this.apps,
  });

  final String title;
  final List<String> apps;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(title),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            scrollDirection: Axis.horizontal,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              for (var app in apps)
                Container(
                  padding: const EdgeInsets.all(1),
                  color: Colors.teal[100],
                  child: Text(app),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
